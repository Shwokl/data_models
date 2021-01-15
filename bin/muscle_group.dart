// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';
import '../../../helpers/query_helper/components/muscle_groups/table.dart';

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
    if (map.containsKey(Table.id)) {
      id = int.parse(map[Table.id]);
    } else {
      id = 0;
    }
    name = map[Table.name];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      Table.id: id,
      Table.name: name,
    };
  }
}
