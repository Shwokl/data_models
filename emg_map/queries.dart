import 'table.dart' as emg;

class Queries {
  /// Creates a new entry in the table with the given exercise and muscle group
  final String insert = '''
    INSERT INTO ${emg.Table.tableName} ( ${emg.Table.insertTarget} )
    VALUES (?, ?);
  ''';

  /// Delete an entry for a given exercise and muscle group
  /// basically, it removes that muscle group from the exercise
  final String deleteSpecific = '''
    DELETE FROM ${emg.Table.tableName}
    WHERE ${emg.Table.exercise} = ?
    AND ${emg.Table.muscleGroup} = ?;
  ''';

  /// Deletes all entries for a given exercise
  final String deleteAllForExercise = '''
    DELETE FROM ${emg.Table.tableName}
    WHERE ${emg.Table.exercise} = ?;
  ''';

  /// Deletes all entries for a given muscle group
  final String deleteAllForMuscleGroup = '''
    DELETE FROM ${emg.Table.tableName}
    WHERE ${emg.Table.muscleGroup} = ?;
  ''';
}
