/// Each String in this namespace references a column name in the database
abstract class Table {
  static const String tableName = 'muscle_groups';

  static const String id = 'muscle_group_id';
  static const String name = 'muscle_group_name';

  /// Specifies the specific fields we want out of the `SELECT`, in order to avoid
  /// the big bad `SELECT *`
  static const String selectTarget = '$id, $name';
}
