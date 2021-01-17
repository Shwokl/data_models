import 'table.dart' as wp;
import '../uwp_map/table.dart' as uwp;

class Queries {
  final String insert = '''
    INSERT INTO ${wp.Table.tableName} (${wp.Table.insertTarget})
    VALUES (?, ?, ?, ?, ?);
  ''';

  final String update = '''
    UPDATE ${wp.Table.tableName} 
    SET ${wp.Table.name} = ?,
        ${wp.Table.description} = ?,
        ${wp.Table.image} = ?,
        ${wp.Table.isPublic} = ?
    WHERE ${wp.Table.id}  = ?;
  ''';

  final String delete = '''
    DELETE FROM ${wp.Table.tableName}
    WHERE ${wp.Table.id} = ?
    LIMIT 1;
  ''';

  final String getById = '''
    SELECT ${wp.Table.selectTarget}
    FROM ${wp.Table.extendedTable}
    WHERE WP.${wp.Table.id} = ?;
  ''';

  final String getPrimaryForUser = '''
    SELECT ${wp.Table.selectTarget}
    FROM ${wp.Table.extendedTable}
    WHERE WP.${wp.Table.id} IN (
      SELECT ${uwp.Table.workoutPlan}
      FROM ${uwp.Table.tableName}
      WHERE ${uwp.Table.isPrimary} = 1
      AND ${uwp.Table.user} = ?
    );
  ''';

  final String getAllPublic = '''
    SELECT ${wp.Table.selectTarget}
    FROM ${wp.Table.extendedTable}
    WHERE WP.${wp.Table.isPublic} = 1;
  ''';

  final String getAllByCreator = '''
    SELECT ${wp.Table.selectTarget}
    FROM ${wp.Table.extendedTable}
    WHERE WP.${wp.Table.creator} = ?;
  ''';

  final String getAllForUser = '''
    SELECT ${wp.Table.selectTarget}
    FROM ${wp.Table.extendedTable}
    WHERE WP.${wp.Table.id} IN (
      SELECT ${uwp.Table.workoutPlan}
      FROM ${uwp.Table.tableName}
      WHERE ${uwp.Table.user} = ?
    )
    UNION
    SELECT ${wp.Table.selectTarget}
    FROM ${wp.Table.extendedTable}
    WHERE WP.${wp.Table.isPublic} = 1;
  ''';
}
