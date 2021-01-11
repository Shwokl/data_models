// External Imports
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'workout_plan.dart';

/// Encapsulates all the data associated to a workout, as described in the
/// database
///
/// ```sql
/// `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `name` VARCHAR(128) NOT NULL,
/// `workout_plan_id` INTEGER NOT NULL
/// ```
class Workout {
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
    id = int.parse(map['workout_id']);
    name = map['workout_name'];
    plan = WorkoutPlan.fromMap(map);
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() {
    Map<String, dynamic> workout = {
      'workout_id': id,
      'workout_name': name,
    };
    workout.addAll(plan.toMap());
    return workout;
  }
}
