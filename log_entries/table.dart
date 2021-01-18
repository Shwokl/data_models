import '../categories/table.dart' as c;

abstract class Table {
  static const String tableName = 'log_entries';

  static const String id = 'log_entry_id';
  static const String workoutLog = 'workout_log_id';
  static const String exerciseName = 'exercise_name';
  static const String category = 'category_id';
  static const String setNr = 'set_number';
  static const String data1 = 'data_1';
  static const String data2 = 'data_2';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget =
      '$workoutLog, $exerciseName, $category, $setNr, $data1, $data2';

  /// Specifies the specific fields we want out of the `SELECT`, in order to avoid
  /// the big bad `SELECT *`
  static const String selectTarget =
      'LE.$id, LE.$workoutLog, LE.$exerciseName, LE.$category, LE.$setNr,LE.$data1, LE.$data2, C.${c.Table.name}';

  /// `JOIN`s together the `log_entries` and `categories` table, so that we can
  /// extract the "full" information about an exercise (the category name too)
  static const String extendedTable = '''
    $tableName LE
    LEFT JOIN ${c.Table.tableName} C ON
      (C.${c.Table.id} = LE.$category)
  ''';
}
