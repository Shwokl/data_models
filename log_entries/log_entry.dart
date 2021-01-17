// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import '../jsonable.dart';
import 'table.dart';
import '../categories/category.dart';
import '../workout_logs/workout_log.dart';

/// Encapsulates all the data associated to a workout log entry, as described in
/// the database
///
/// ``` sql
/// `log_entry_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `log_entry_workout_log_id` INTEGER NOT NULL,
/// `log_entry_exercise_name` VARCHAR(128) NOT NULL,
/// `log_entry_exercise_category_id` INTEGER NOT NULL,
/// `log_entry_set_number` INTEGER NOT NULL,
/// `log_entry_data_1` INTEGER NOT NULL,
/// `log_entry_data_2` INTEGER DEFAULT 0
/// ```
class LogEntry extends Jsonable {
  int id;
  WorkoutLog log;
  String exerciseName;
  Category category;
  int setNumber;
  int data1;
  int data2;

  LogEntry({
    @required this.id,
    @required this.log,
    @required this.exerciseName,
    @required this.category,
    @required this.setNumber,
    @required this.data1,
    this.data2 = 0,
  });

  LogEntry.fromJson(final String json) : this.fromMap(jsonDecode(json));
  LogEntry.fromMap(final Map<String, dynamic> map) {
    id = int.parse(Jsonable.tryExtract(map, Table.id, '0'));
    log = WorkoutLog.fromMap(map);
    exerciseName = map[Table.exerciseName];
    category = Category.fromMap(map);
    setNumber = int.parse(map[Table.setNr]);
    data1 = int.parse(map[Table.data1]);
    data2 = int.parse(map[Table.data2]);
  }

  @override
  bool hasDataForUpdate() => hasDataForInsert() && id != null && id != 0;
  @override
  bool hasDataForInsert() {
    return this != null &&
        log != null &&
        log.id != null &&
        log.id != 0 &&
        exerciseName != null &&
        exerciseName.isNotEmpty &&
        category != null &&
        category.id != null &&
        category.id != 0 &&
        setNumber != null &&
        setNumber > 0 &&
        data1 != null &&
        data1 > 0 &&
        data2 != null &&
        data2 > 0;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> entry = {
      Table.id: id,
      Table.exerciseName: exerciseName,
      Table.setNr: setNumber,
      Table.data1: data1,
      Table.data2: data2,
    };
    entry..addAll(log.toMap())..addAll(category.toMap());
    return entry;
  }
}
