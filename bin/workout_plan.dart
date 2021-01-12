// External Imports
import 'package:meta/meta.dart' show required;

//Local import
import 'access_level.dart';
import 'jsonable.dart';
import 'user.dart';

/// Encapsulates all the data associated to a workout plan, as described in the
/// database
///
/// ``` sql
/// `workout_plan_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `workout_plan_name` VARCHAR(128) NOT NULL,
/// `workout_plan_description` VARCHAR(512) DEFAULT NULL,
/// `workout_plan_image` VARCHAR(256) DEFAULT NULL,
/// `workout_plan_creator_id` INTEGER NOT NULL,
/// `workout_plan_is_public` BOOLEAN NOT NULL DEFAULT FALSE,
/// `workout_plan_default_access_level_id` INTEGER NOT NULL DEFAULT 3
/// ```
class WorkoutPlan extends Jsonable {
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

  @override
  WorkoutPlan fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['muscle_group_id']);
    name = map['muscle_group_name'];
    description = map['muscle_group_description'];
    image = map['muscle_group_image'];
    isPublic = map['workout_plan_is_public'].toString() == '1';
    creator = creator.fromMap(map);
    defaultAccess = defaultAccess.fromMap(map);
    return this;
  }

  @override
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
