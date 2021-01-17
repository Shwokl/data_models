import 'table.dart' as le;

class Queries {
  final String insert = '''
    INSERT INTO ${le.Table.tableName} ( ${le.Table.insertTarget} )
    VALUES (?, ?, ?, ?, ?, ?);
  ''';

  final String update = '''
    UPDATE ${le.Table.tableName} 
    SET ${le.Table.data1} = ?,
        ${le.Table.data2}, = ?
    WHERE ${le.Table.id} = ?;
  ''';

  final String delete = '''
    DELETE FROM ${le.Table.tableName}
    WHERE ${le.Table.id} = ?
    LIMIT 1;
  ''';

  final String getById = '''
    SELECT ${le.Table.selectTarget}
    FROM ${le.Table.extendedTable}
    WHERE LE.${le.Table.id} = ?;
  ''';

  final String getAllForWorkoutLog = '''
    SELECT ${le.Table.selectTarget}
    FROM ${le.Table.extendedTable}
    WHERE LE.${le.Table.workoutLog} = ?;
  ''';
}
