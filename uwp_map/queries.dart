import 'table.dart' as uwp;
import '../workout_plans/table.dart' as wp;
import '../users/table.dart' as u;

class Queries {
  final String insert = '''
    INSERT INTO ${uwp.Table.tableName} ( ${uwp.Table.insertTarget} )
    VALUES (?, ?, ?);
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

  final String getAllWorkoutPlansForUser = '''
    SELECT ${wp.Table.selectTarget}
    FROM ${wp.Table.extendedTable}
    WHERE UWP.${uwp.Table.user} = ?;
  ''';

  final String getAllUsersForWorkoutPlan = '''
    SELECT ${u.Table.selectTarget}
    FROM ${u.Table.extendedTable}
    WHERE U.${u.Table.id} IN (
      SELECT ${uwp.Table.user}
      FROM ${uwp.Table.tableName}
      WHERE ${uwp.Table.workoutPlan} = ?
    );
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

  final String disableAllPrimaryForUser = '''
    UPDATE ${uwp.Table.tableName}
    SET ${uwp.Table.isPrimary} = 0
    WHERE ${uwp.Table.user} = ?
    AND ${uwp.Table.isPrimary} = 1;
  ''';

  /// Set/Unset workout plan as primary
  final String update = '''
    UPDATE ${uwp.Table.tableName}
    SET ${uwp.Table.isPrimary} = ?
    WHERE ${uwp.Table.user} = ?
    AND ${uwp.Table.workoutPlan} = ?;
  ''';

  /// Delete an entry for a given user and workout plan.
  /// basically, it removes the workout plan from the user's list
  final String delete = '''
    DELETE FROM ${uwp.Table.tableName}
    WHERE ${uwp.Table.user} = ?
    AND ${uwp.Table.workoutPlan} = ?;
  ''';

  /// Delete an entry for a given user and workout plan.
  /// basically, it removes the workout plan from the user's list
  final String checkIfDuplicate = '''
    SELECT ${uwp.Table.user}
    FROM ${uwp.Table.tableName}
    WHERE ${uwp.Table.user} = ?
    AND ${uwp.Table.workoutPlan} = ?;
  ''';
}
