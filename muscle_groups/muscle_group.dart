// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import '../jsonable.dart';
import 'table.dart';

/// Encapsulates all the data associated to a muscle group, as described in the
/// database
///
/// ``` sql
/// `muscle_group_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `muscle_group_name` VARCHAR(32) UNIQUE NOT NULL
/// ```
class MuscleGroup extends Jsonable {
  int id;
  String name;

  /// Constructor from 'raw data'
  MuscleGroup({
    @required this.id,
    @required this.name,
  });

  MuscleGroup.fromJson(final String json) : this.fromMap(jsonDecode(json));
  MuscleGroup.fromMap(final Map<String, dynamic> map) {
    id = int.parse(Jsonable.tryExtract(map, Table.id, '0'));
    name = map[Table.name];
  }

  @override
  bool hasDataForUpdate() => hasDataForInsert() && id != null && id > 0;
  @override
  bool hasDataForInsert() => this != null && name != null && name.isNotEmpty;

  @override
  Map<String, dynamic> toMap() {
    return {
      Table.id: id,
      Table.name: name,
    };
  }
}
