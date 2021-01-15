// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'category.dart';
import 'jsonable.dart';
import 'workout_log.dart';
import '../../../helpers/query_helper/components/log_entries/table.dart';

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
    @required this.data2,
  });

  LogEntry.fromJson(final String json) : this.fromMap(jsonDecode(json));
  LogEntry.fromMap(final Map<String, dynamic> map) {
    if (map.containsKey(Table.id)) {
      id = int.parse(map[Table.id]);
    } else {
      id = 0;
    }
    log = WorkoutLog.fromMap(map);
    exerciseName = map[Table.exerciseName];
    category = Category.fromMap(map);
    setNumber = int.parse(map[Table.setNr]);
    data1 = int.parse(map[Table.data1]);
    data2 = int.parse(map[Table.data2]);
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
