// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';
import 'workout_plan.dart';
import '../../../helpers/query_helper/components/workouts/table.dart';

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
  String image;
  WorkoutPlan plan;

  /// Constructor from 'raw data'
  Workout({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.plan,
  });

  Workout.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Workout.fromMap(final Map<String, dynamic> map) {
    if (map.containsKey(Table.id)) {
      id = int.parse(map[Table.id]);
    } else {
      id = 0;
    }
    name = map[Table.name];
    image = map[Table.image];
    plan = WorkoutPlan.fromMap(map);
  }

  bool hasDataForUpdate() => id != null && id != 0 && hasDataForInsert();
  bool hasDataForInsert() {
    return name != null &&
        name.isNotEmpty &&
        plan != null &&
        plan.id != null &&
        plan.id != 0;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> workout = {
      Table.id: id,
      Table.name: name,
      Table.image: image,
    };
    workout.addAll(plan.toMap());
    return workout;
  }
}
