// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'category.dart';
import 'jsonable.dart';
import 'workout_log.dart';

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
    if (map.containsKey('log_entry_id')) {
      id = int.parse(map['log_entry_id']);
    } else {
      id = 0;
    }
    log = WorkoutLog.fromMap(map);
    exerciseName = map['log_entry_exercise_name'];
    category = Category.fromMap(map);
    setNumber = int.parse(map['log_entry_set_number']);
    data1 = int.parse(map['log_entry_data_1']);
    data2 = int.parse(map['log_entry_data_2']);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> entry = {
      'log_entry_id': id,
      'log_entry_exercise_name': exerciseName,
      'log_entry_set_number': setNumber,
      'log_entry_data_1': data1,
      'log_entry_data_2': data2,
    };
    entry..addAll(log.toMap())..addAll(category.toMap());
    return entry;
  }
}
