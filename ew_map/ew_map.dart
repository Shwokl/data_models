// External imports
import 'dart:convert' show jsonDecode;

// Local imports
import '../insertable.dart';
import '../jsonable.dart';
import 'table.dart';

class EwMap extends Jsonable with Insertable {
  int exerciseId;
  int workoutId;
  int sets;

  EwMap({this.exerciseId, this.workoutId, this.sets});
  EwMap.fromJson(final String json)
      : this.fromMap(jsonDecode(json) as Map<String, dynamic>);
  EwMap.fromMap(final Map<String, dynamic> map) {
    exerciseId = int.parse(Jsonable.tryExtract(map, Table.exercise, '0'));
    workoutId = int.parse(Jsonable.tryExtract(map, Table.workout, '0'));
    sets = int.parse(Jsonable.tryExtract(map, Table.sets, '0'));
  }

  @override
  bool hasDataForInsert() => hasDataForUpdate();

  @override
  bool hasDataForUpdate() => exerciseId > 0 && workoutId > 0 && sets > 0;

  @override
  List toInsertArray() => [exerciseId, workoutId, sets];

  @override
  Map<String, dynamic> toMap() {
    return {
      Table.exercise: exerciseId,
      Table.workout: workoutId,
      Table.sets: sets,
    };
  }

  @override
  List toUpdateArray() => [sets, exerciseId, workoutId];
}
