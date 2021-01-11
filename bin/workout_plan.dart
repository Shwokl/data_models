// External Imports
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:meta/meta.dart' show required;

//Local import
import 'access_level.dart';
import 'user.dart';

/// Encapsulates all the data associated to a workout plan, as described in the
/// database
///
/// ``` sql
/// `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `name` VARCHAR(128) NOT NULL,
/// `description` VARCHAR(512) DEFAULT NULL,
/// `image` VARCHAR(256) DEFAULT NULL,
/// `creator_id` INTEGER NOT NULL,
/// `is_public` BOOLEAN NOT NULL DEFAULT FALSE,
/// `default_access_level_id` INTEGER NOT NULL DEFAULT 3
/// ```
class WorkoutPlan {
  int id;
  String name;
  String description;
  String image;
  User creator;
  bool isPublic;
  AccessLevel defaultAccess;
  // TODO: List<Workout> workouts;

  WorkoutPlan({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.image,
    @required this.creator,
    @required this.isPublic,
    @required this.defaultAccess,
  });

  WorkoutPlan.fromJson(final String json) : this.fromMap(jsonDecode(json));
  WorkoutPlan.fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['muscle_group_id']);
    name = map['muscle_group_name'];
    description = map['muscle_group_description'];
    image = map['muscle_group_image'];
    isPublic = map['workout_plan_is_public'].toString() == '1';
    creator = User.fromMap(map);
    defaultAccess = AccessLevel.fromMap(map);
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() {
    Map<String, dynamic> workout_plan = {
      'workout_plan_id': id,
      'workout_plan_name': name,
      'workout_plan_description': description,
      'workout_plan_image': image,
      'workout_plan_is_public': isPublic,
    };
    workout_plan.addAll(creator.toMap());
    workout_plan.addAll(defaultAccess.toMap());
    return workout_plan;
  }
}