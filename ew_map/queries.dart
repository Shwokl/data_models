import 'table.dart' as ew;

class Queries {
  /// Create a new entry in the table with the given exercise, workout and sets count
  final String insert = '''
    INSERT INTO ${ew.Table.tableName} ( ${ew.Table.insertTarget} )
    VALUES (?, ?, ?);
  ''';

  /// Updates the sets associated to the exercise and workout
  final String update = '''
    UPDATE ${ew.Table.tableName}
    SET ${ew.Table.sets} = ?
    WHERE ${ew.Table.exercise} = ?
    AND ${ew.Table.workout} = ?;
  ''';

  /// Delete an entry for a given exercise and workout
  /// basically, it removes the exercise from the workout
  final String deleteSpecific = '''
    DELETE FROM ${ew.Table.tableName}
    WHERE ${ew.Table.exercise} = ?
    AND ${ew.Table.workout} = ?;
  ''';

  /// Deletes all entries for a given exercise
  final String deleteAllForExercise = '''
    DELETE FROM ${ew.Table.tableName}
    WHERE ${ew.Table.exercise} = ?;
  ''';

  /// Deletes all entries for a given workout
  final String deleteAllForMuscleGroup = '''
    DELETE FROM ${ew.Table.tableName}
    WHERE ${ew.Table.workout} = ?;
  ''';
}
