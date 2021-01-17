/// Each String in this namespace references a column name in the database
abstract class Table {
  static const String tableName = 'roles';

  static const String id = 'role_id';
  static const String name = 'role_name';

  /// Specifies the specific fields we want out of the `SELECT`, in order to avoid
  /// the big bad `SELECT *`
  static const String selectTarget = '$id, $name';
}
