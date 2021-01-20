import '../roles/table.dart' as r;
import '../users/table.dart' as u;

abstract class Table {
  static const String tableName = 'workout_logs';

  static const String id = 'workout_log_id';
  static const String user = 'user_id';
  static const String name = 'workout_log_name';
  static const String date = 'workout_log_date';
  static const String duration = 'workout_log_duration';
  static const String notes = 'workout_log_notes';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget = '$user, $name, $date, $duration, $notes';

  /// Specifies the specific fields we want out of the `SELECT`, in order to avoid
  /// the big bad `SELECT *`
  static const String selectTarget = '''
    WL.$id, WL.$user, WL.$name, WL.$date, WL.$duration, WL.$notes,
    U.${u.Table.name}, U.${u.Table.username}, U.${u.Table.password}, 
    U.${u.Table.spice}, U.${u.Table.email}, U.${u.Table.role}, U.${u.Table.avatar},
    U.${u.Table.isActive}, R.${r.Table.name}
  ''';

  /// `JOIN`s together the `workout_logs`, `users` and `roles` table, so that we
  /// can extract the "full" information about a workout log (the creator name too)
  static const String extendedTable = '''
    $tableName WL
    LEFT JOIN ${u.Table.tableName} U ON
      (U.${u.Table.id} = WL.$user)
    LEFT JOIN ${r.Table.tableName} R ON
      (R.${r.Table.id} = U.${u.Table.role})
  ''';
}
