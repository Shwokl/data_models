// External imports
import 'dart:convert' show jsonDecode;

// Local imports
import '../insertable.dart';
import '../jsonable.dart';
import 'table.dart';

class UwpMap extends Jsonable with Insertable {
  int userId;
  int workoutPlanId;
  int isPrimary;

  UwpMap({this.userId, this.workoutPlanId, this.isPrimary});
  UwpMap.fromJson(final String json)
      : this.fromMap(jsonDecode(json) as Map<String, dynamic>);
  UwpMap.fromMap(final Map<String, dynamic> map) {
    userId = int.parse(Jsonable.tryExtract(map, Table.user, '0'));
    workoutPlanId = int.parse(Jsonable.tryExtract(map, Table.workoutPlan, '0'));
    isPrimary = int.parse(Jsonable.tryExtract(map, Table.isPrimary, '0'));
  }
  @override
  bool hasDataForInsert() {
    return userId > 0 &&
        workoutPlanId > 0 &&
        (isPrimary == 0 || isPrimary == 1);
  }

  @override
  bool hasDataForUpdate() => hasDataForInsert();

  @override
  List toInsertArray() => [userId, workoutPlanId, isPrimary];
  @override
  Map<String, dynamic> toMap() {
    return {
      Table.user: userId,
      Table.workoutPlan: workoutPlanId,
      Table.isPrimary: isPrimary,
    };
  }

  @override
  List toUpdateArray() => [isPrimary, userId, workoutPlanId];
}
