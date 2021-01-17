/// Each String in this namespace references a column name in the database
abstract class Table {
  static const String tableName = 'categories';

  static const String id = 'category_id';
  static const String name = 'category_name';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String selectTarget = '$id, $name';
}
