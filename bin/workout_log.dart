// External Imports
import 'package:meta/meta.dart' show required;

// Local Imports
import 'jsonable.dart';
import 'user.dart';

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

  @override
  WorkoutLog fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['workout_log_id']);
    duration = int.parse(map['workout_log_duration']);
    name = map['workout_log_name'];
    date = map['workout_log_date'];
    notes = map['workout_log_notes'];
    user = user.fromMap(map);
    return this;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> log = {
      'workout_log_id': id,
      'workout_log_duration': duration,
      'workout_log_name': name,
      'workout_log_date': date,
      'workout_log_notes': notes,
    };
    log.addAll(user.toMap());
    return log;
  }
}
