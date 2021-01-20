import '../exercises/table.dart' as e;
import 'table.dart' as ew;

class Queries {
  /// Adds an entry in `ew_map` with the given exercise and workout
  final String addToWorkout = '''
    INSERT INTO ${ew.Table.tableName} (${ew.Table.insertTarget})
    VALUES (?, ?, ?)
  ''';

  /// Get a list of all exercises that are associated to the given workout
  /// in the `ew_map` table
  final String getAllByWorkout = '''
    SELECT ${e.Table.selectTarget}
    FROM ${e.Table.extendedTable}
    WHERE E.${e.Table.id} IN (
      SELECT ${ew.Table.exercise}
      FROM ${ew.Table.tableName}
      WHERE ${ew.Table.workout} = ?
    );
  ''';

  /// Delete the entry from `ew_map` for the given exercise and workout
  /// basically, it removes the exercise from the workout
  final String updateSetsForWorkout = '''
    UPDATE ${ew.Table.tableName}
    SET ${ew.Table.sets} = ?
    WHERE ${ew.Table.exercise} = ?
    AND ${ew.Table.workout} = ?;
  ''';

  /// Delete the entry from `ew_map` for the given exercise and workout
  /// basically, it removes the exercise from the workout
  final String removeFromWorkout = '''
    DELETE FROM ${ew.Table.tableName}
    WHERE ${ew.Table.exercise} = ?
    AND ${ew.Table.workout} = ?;
  ''';

  final String checkIfDuplicate = '''
    SELECT ${ew.Table.exercise}
    FROM ${ew.Table.tableName}
    WHERE ${ew.Table.exercise} = ?
    AND ${ew.Table.workout} = ?;
  ''';
}
