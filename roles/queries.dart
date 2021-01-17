import 'table.dart' as r;

class Queries {
  /// ``` SQL
  /// SELECT * FROM roles WHERE role_id = ?;
  /// ```
  final String getById = '''
    SELECT ${r.Table.selectTarget}
    FROM ${r.Table.tableName}
    WHERE ${r.Table.id} = ?;
  ''';

  /// ``` SQL
  /// SELECT * FROM roles;
  /// ```
  final String getAll = '''
    SELECT ${r.Table.selectTarget}
    FROM ${r.Table.tableName};
  ''';
}
