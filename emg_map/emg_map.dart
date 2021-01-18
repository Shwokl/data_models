// External imports
import 'dart:convert' show jsonDecode;

// Local imports
import '../insertable.dart';
import '../jsonable.dart';
import 'table.dart';

class EmgMap extends Jsonable with Insertable {
  int exerciseId;
  int muscleGroupId;

  EmgMap({this.exerciseId, this.muscleGroupId});
  EmgMap.fromJson(final String json) : this.fromMap(jsonDecode(json));
  EmgMap.fromMap(final Map<String, dynamic> map) {
    exerciseId = int.parse(Jsonable.tryExtract(map, Table.exercise, '0'));
    muscleGroupId = int.parse(Jsonable.tryExtract(map, Table.muscleGroup, '0'));
  }

  @override
  bool hasDataForInsert() => exerciseId > 0 && muscleGroupId > 0;

  @override
  bool hasDataForUpdate() => hasDataForInsert();

  @override
  List toInsertArray() => [exerciseId, muscleGroupId];

  @override
  Map<String, dynamic> toMap() =>
      {Table.exercise: exerciseId, Table.muscleGroup: muscleGroupId};

  @override
  List toUpdateArray() => null;
}
