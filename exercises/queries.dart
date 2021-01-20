// Local imports
import '../categories/table.dart' as c;
import 'table.dart' as e;

class Queries {
  final String insert = '''
    INSERT INTO ${e.Table.tableName} ( ${e.Table.insertTarget} )
    VALUES (?, ?, ?, ?, ?);
  ''';

  final String update = '''
    UPDATE ${e.Table.tableName}
    SET ${e.Table.name} = ?,
        ${e.Table.description} = ?,
        ${e.Table.notes} = ?,
        ${e.Table.icon} = ?,
        ${e.Table.category} = ?
    WHERE ${e.Table.id} = ?;
  ''';

  final String delete = '''
    DELETE FROM ${e.Table.tableName}
    WHERE ${e.Table.id} = ?
    LIMIT 1;
  ''';

  final String getById = '''
    SELECT ${e.Table.selectTarget}
    FROM ${e.Table.extendedTable}
    WHERE E.${e.Table.id} = ?;
  ''';

  final String checkNameTaken = '''
    SELECT ${e.Table.selectTarget}
    FROM ${e.Table.extendedTable}
    WHERE E.${e.Table.name} = ?
    AND E.${e.Table.id} != ?;
  ''';

  final String getAll = '''
    SELECT ${e.Table.selectTarget}
    FROM ${e.Table.extendedTable};
  ''';

  final String getAllByCategory = '''
    SELECT ${e.Table.selectTarget}
    FROM ${e.Table.extendedTable}
    WHERE C.${c.Table.id} = ?;
  ''';
}
