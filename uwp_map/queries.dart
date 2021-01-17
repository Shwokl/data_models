import 'table.dart' as uwp;

class Queries {
  final String insert = '''
    INSERT INTO ${uwp.Table.tableName} ( ${uwp.Table.insertTarget} )
    VALUES (?, ?, ?);
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
  final String deleteSpecific = '''
    DELETE FROM ${uwp.Table.tableName}
    WHERE ${uwp.Table.user} = ?
    AND ${uwp.Table.workoutPlan} = ?;
  ''';

  /// Deletes all entries for a given user
  final String deleteAllForExercise = '''
    DELETE FROM ${uwp.Table.tableName}
    WHERE ${uwp.Table.user} = ?;
  ''';

  /// Deletes all entries for a given workout plan
  final String deleteAllForMuscleGroup = '''
    DELETE FROM ${uwp.Table.tableName}
    WHERE ${uwp.Table.workoutPlan} = ?;
  ''';
}
