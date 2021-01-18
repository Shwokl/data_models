import 'table.dart' as le;

class Queries {
  final String insert = '''
    INSERT INTO ${le.Table.tableName} ( ${le.Table.insertTarget} )
    VALUES (?, ?, ?, ?, ?, ?);
  ''';

  final String update = '''
    UPDATE ${le.Table.tableName} 
    SET ${le.Table.data1} = ?,
        ${le.Table.data2} = ?
    WHERE ${le.Table.id} = ?;
  ''';

  final String deleteById = '''
    DELETE FROM ${le.Table.tableName}
    WHERE ${le.Table.id} = ?
    LIMIT 1;
  ''';

  final String deleteAllForWorkoutLog = '''
    DELETE FROM ${le.Table.tableName}
    WHERE ${le.Table.workoutLog} = ?;
  ''';

  final String deleteAllForExerciseInWorkoutLog = '''
    DELETE FROM ${le.Table.tableName}
    WHERE ${le.Table.exerciseName} = ?
    AND ${le.Table.workoutLog} = ?;
  ''';

  final String getById = '''
    SELECT ${le.Table.selectTarget}
    FROM ${le.Table.extendedTable}
    WHERE LE.${le.Table.id} = ?;
  ''';

  final String getAllByWorkoutLog = '''
    SELECT ${le.Table.selectTarget}
    FROM ${le.Table.extendedTable}
    WHERE LE.${le.Table.workoutLog} = ?;
  ''';

  final String getAllByExerciseName = '''
    SELECT ${le.Table.selectTarget}
    FROM ${le.Table.extendedTable}
    WHERE LE.${le.Table.exerciseName} = ?;
  ''';
}
