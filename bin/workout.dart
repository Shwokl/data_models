// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';
import 'workout_plan.dart';

/// Encapsulates all the data associated to a workout, as described in the
/// database
///
/// ```sql
/// `workout_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `workout_name` VARCHAR(128) NOT NULL,
/// `workout_workout_plan_id` INTEGER NOT NULL
/// ```
class Workout extends Jsonable {
  int id;
  String name;
  WorkoutPlan plan;

  /// Constructor from 'raw data'
  Workout({
    @required this.id,
    @required this.name,
    @required this.plan,
  });

  Workout.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Workout.fromMap(final Map<String, dynamic> map) {
    if (map.containsKey('workout_id')) {
      id = int.parse(map['workout_id']);
    } else {
      id = 0;
    }
    name = map['workout_name'];
    plan = WorkoutPlan.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> workout = {
      'workout_id': id,
      'workout_name': name,
    };
    workout.addAll(plan.toMap());
    return workout;
  }
}
