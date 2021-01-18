// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import '../insertable.dart';
import '../jsonable.dart';
import 'table.dart';
import '../workout_plans/workout_plan.dart';

/// Encapsulates all the data associated to a workout, as described in the
/// database
///
/// ```sql
/// `workout_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `workout_name` VARCHAR(128) NOT NULL,
/// `workout_workout_plan_id` INTEGER NOT NULL
/// ```
class Workout extends Jsonable with Insertable {
  int id;
  String name;
  String image;
  WorkoutPlan plan;

  /// Constructor from 'raw data'
  Workout({
    @required this.id,
    @required this.name,
    this.image = Table.defaultImage,
    @required this.plan,
  });

  Workout.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Workout.fromMap(final Map<String, dynamic> map) {
    id = int.parse(Jsonable.tryExtract(map, Table.id, '0'));
    name = map[Table.name];
    image = Jsonable.tryExtract(map, Table.image, Table.defaultImage);
    plan = WorkoutPlan.fromMap(map);
  }

  @override
  bool hasDataForUpdate() => id != null && id > 0 && hasDataForInsert();
  @override
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

  @override
  List<dynamic> toInsertArray() => [name, image, plan.id];
  @override
  List<dynamic> toUpdateArray() => [name, image, id];
}
