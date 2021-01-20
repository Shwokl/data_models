import '../categories/table.dart' as c;

abstract class Table {
  static const String tableName = 'exercises';

  static const String id = 'exercise_id';
  static const String name = 'exercise_name';
  static const String description = 'exercise_description';
  static const String notes = 'exercise_notes';
  static const String icon = 'exercise_icon';
  static const String category = 'category_id';

  // TODO FIXME
  static const String defaultIcon = '/path/to/default/exercise/icon.png';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget =
      '$name, $description, $notes, $icon, $category';

  /// Specifies the specific fields we want out of the `SELECT`, in order to avoid
  /// the big bad `SELECT *`
  static const String selectTarget =
      'E.$id, E.$name, E.$description, E.$notes, E.$icon, E.$category, C.${c.Table.name}';

  /// `JOIN`s together the `exercises` and `categories` table, so that we can
  /// extract the "full" information about an exercise (the category name too)
  ///
  /// ``` SQL
  /// exercises E
  /// LEFT JOIN categories C ON
  ///   (E.category_id = C.category_id)
  /// ```
  static const String extendedTable = '''
    $tableName E
    LEFT JOIN ${c.Table.tableName} C ON
      (C.${c.Table.id} = E.$category)
  ''';
}
