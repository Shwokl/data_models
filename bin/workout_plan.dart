// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

//Local import
import 'jsonable.dart';
import 'user.dart';
import '../../../helpers/query_helper/components/workout_plans/table.dart';

/// Encapsulates all the data associated to a workout plan, as described in the
/// database
///
/// ``` sql
/// `workout_plan_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `workout_plan_name` VARCHAR(128) NOT NULL,
/// `workout_plan_description` VARCHAR(512) DEFAULT NULL,
/// `workout_plan_image` VARCHAR(256) DEFAULT NULL,
/// `workout_plan_creator_id` INTEGER NOT NULL,
/// `workout_plan_is_public` BOOLEAN NOT NULL DEFAULT FALSE
/// ```
class WorkoutPlan extends Jsonable {
  int id;
  String name;
  String description;
  String image;
  User creator;
  bool isPublic;

  WorkoutPlan({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.image,
    @required this.creator,
    @required this.isPublic,
  });

  WorkoutPlan.fromJson(final String json) : this.fromMap(jsonDecode(json));
  WorkoutPlan.fromMap(final Map<String, dynamic> map) {
    if (map.containsKey(Table.id)) {
      id = int.parse(map[Table.id]);
    } else {
      id = 0;
    }
    name = map[Table.name];
    description = map[Table.description];
    image = map[Table.image];
    isPublic = map[Table.isPublic].toString() == '1';
    creator = User.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> workout_plan = {
      Table.id: id,
      Table.name: name,
      Table.description: description,
      Table.image: image,
      Table.isPublic: isPublic,
    };
    workout_plan.addAll(creator.toMap());
    return workout_plan;
  }
}
