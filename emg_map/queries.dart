import 'table.dart' as emg;
import '../exercises/table.dart' as e;
import '../muscle_groups/table.dart' as mg;

class Queries {
  /// Creates a new entry in the table with the given exercise and muscle group
  final String insert = '''
    INSERT INTO ${emg.Table.tableName} ( ${emg.Table.insertTarget} )
    VALUES (?, ?);
  ''';

  final String getAllExercisesForMuscleGroup = '''
    SELECT ${e.Table.selectTarget}
    FROM ${e.Table.extendedTable}
    WHERE E.${e.Table.id} IN (
      SELECT ${emg.Table.exercise}
      FROM ${emg.Table.tableName}
      WHERE ${emg.Table.muscleGroup} = ?
    );
  ''';

  /// Get all muscle groups associated with the given `exerciseId`
  final String getAllMuscleGroupsForExercise = '''
    SELECT ${mg.Table.selectTarget}
    FROM ${mg.Table.tableName}
    WHERE ${mg.Table.id} IN (
      SELECT ${emg.Table.exercise}
      FROM ${emg.Table.tableName}
      WHERE ${emg.Table.exercise} = ?
    );
  ''';

  /// Delete an entry for a given exercise and muscle group
  /// basically, it removes that muscle group from the exercise
  final String delete = '''
    DELETE FROM ${emg.Table.tableName}
    WHERE ${emg.Table.exercise} = ?
    AND ${emg.Table.muscleGroup} = ?;
  ''';

  final String checkIfDuplicate = '''
    SELECT ${emg.Table.exercise}
    FROM ${emg.Table.tableName}
    WHERE E.${emg.Table.exercise} = ?
    AND E.${emg.Table.muscleGroup} = ?;
  ''';
}
