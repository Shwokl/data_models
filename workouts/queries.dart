import 'table.dart' as w;

class Queries {
  final String insert = '''
    INSERT INTO ${w.Table.tableName} (${w.Table.insertTarget})
    VALUES (?, ?, ?)
  ''';

  final String update = '''
    UPDATE ${w.Table.tableName}
    SET ${w.Table.name} = ?,
        ${w.Table.image} = ?
    WHERE ${w.Table.id} = ?;
  ''';

  final String delete = '''
    DELETE FROM ${w.Table.tableName}
    WHERE ${w.Table.id} = ?
    LIMIT 1;
  ''';

  final String deleteAllForWorkoutPlan = '''
    DELETE FROM ${w.Table.tableName}
    WHERE ${w.Table.workoutPlan} = ?;
  ''';

  final String getById = '''
    SELECT ${w.Table.selectTarget}
    FROM ${w.Table.extendedTable}
    WHERE W.${w.Table.id} = ?;
  ''';

  final String getByWorkoutPlan = '''
    SELECT ${w.Table.selectTarget}
    FROM ${w.Table.extendedTable}
    WHERE W.${w.Table.workoutPlan} = ?;
  ''';
}
