import 'table.dart' as c;

class Queries {
  /// Get a single category based on the unique id
  final String getById = '''
    SELECT ${c.Table.selectTarget}
    FROM ${c.Table.tableName}
    WHERE ${c.Table.id} = ?
  ''';

  /// Get a table with all existing categories
  final String getAll = '''
    SELECT ${c.Table.selectTarget}
    FROM ${c.Table.tableName};
  ''';
}
