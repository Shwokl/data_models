import '../emg_map/table.dart' as emg;
import '../ew_map/table.dart' as ew;
import 'table.dart' as mg;

class Queries {
  /// Performs a `SELECT` operation, looking for the given id
  final String getById = '''
    SELECT ${mg.Table.selectTarget}
    FROM ${mg.Table.tableName}
    WHERE ${mg.Table.id} = ?;
  ''';

  /// Performs a `SELECT` operation with no filters
  final String getAll = '''
    SELECT ${mg.Table.selectTarget}
    FROM ${mg.Table.tableName};
  ''';

  /// Gets all the muscle groups for a given exercise
  final String getAllForExercise = '''
    SELECT ${mg.Table.selectTarget}
    FROM ${mg.Table.tableName}
    WHERE ${mg.Table.id} IN (
      SELECT ${emg.Table.muscleGroup}
      FROM ${emg.Table.tableName}
      WHERE ${emg.Table.exercise} = ?
    );
  ''';

  /// Gets all the muscle groups for a given workout
  final String getAllForWorkout = '''
    SELECT ${mg.Table.selectTarget}
    FROM ${mg.Table.tableName}
    WHERE ${mg.Table.id} IN (
      SELECT MG.${mg.Table.id}
      FROM ${emg.Table.tableName} EMG
      JOIN ${mg.Table.tableName} MG ON
        (MG.${mg.Table.id} = EMG.${emg.Table.muscleGroup})
      JOIN ${ew.Table.tableName} EW ON
        (EW.${ew.Table.exercise} = EMG.${emg.Table.exercise})
      WHERE EW.${ew.Table.workout} = ?
    );
  ''';
}
