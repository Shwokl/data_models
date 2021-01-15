// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';
import 'user.dart';
import '../../../helpers/query_helper/components/workout_logs/table.dart';

/// Encapsulates all the data associated to a workout log, as described in the
/// database
///
/// ``` sql
/// `workout_log_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `workout_log_user_id` INTEGER,
/// `workout_log_name` VARCHAR(128) NOT NULL,
/// `workout_log_date` DATE NOT NULL DEFAULT NOW(),
/// `workout_log_duration` INTEGER NOT NULL,
/// `workout_log_notes` VARCHAR(512) DEFAULT NULL
/// ```
class WorkoutLog extends Jsonable {
  int id;
  User user;
  String name;
  String date;
  int duration;
  String notes;

  WorkoutLog({
    @required this.id,
    @required this.user,
    @required this.name,
    @required this.date,
    @required this.duration,
    @required this.notes,
  });

  WorkoutLog.fromJson(final String json) : this.fromMap(jsonDecode(json));
  WorkoutLog.fromMap(final Map<String, dynamic> map) {
    if (map.containsKey(Table.id)) {
      id = int.parse(map[Table.id]);
    } else {
      id = 0;
    }
    duration = int.parse(map[Table.duration]);
    name = map[Table.name];
    date = map[Table.date];
    notes = map[Table.notes];
    user = User.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> log = {
      Table.id: id,
      Table.duration: duration,
      Table.name: name,
      Table.date: date,
      Table.notes: notes,
    };
    log.addAll(user.toMap());
    return log;
  }
}
