import '../users/table.dart' as u;
import 'table.dart' as wl;

class Queries {
  final String insert = '''
    INSERT INTO ${wl.Table.tableName} (${wl.Table.insertTarget})
    VALUES (?, ?, ?, ?, ?);
  ''';

  final String update = '''
    UPDATE ${wl.Table.tableName}
    SET ${wl.Table.name} = ?,
        ${wl.Table.date} = ?,
        ${wl.Table.duration} = ?,
        ${wl.Table.notes} = ?
    WHERE ${wl.Table.id} = ?;
  ''';

  final String delete = '''
    DELETE FROM ${wl.Table.tableName}
    WHERE ${wl.Table.id} = ?
    LIMIT 1;
  ''';

  final String getById = '''
    SELECT ${wl.Table.selectTarget}
    FROM ${wl.Table.extendedTable}
    WHERE WL.${wl.Table.id} = ?;
  ''';

  final String getAllForUser = '''
    SELECT ${wl.Table.selectTarget}
    FROM ${wl.Table.extendedTable}
    WHERE U.${u.Table.id} = ?;
  ''';

  final String getAllForDateBetween = '''
    SELECT ${wl.Table.selectTarget}
    FROM ${wl.Table.extendedTable}
    WHERE WL.${wl.Table.user} = ?
    AND WL.${wl.Table.date} BETWEEN ? AND ?;
  ''';
}
