// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';
import '../../../helpers/query_helper/components/roles/table.dart';

/// Encapsulates all the data associated to a role, as described in the database
///
/// ``` sql
/// `role_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `role_name` VARCHAR(32) UNIQUE NOT NULL
/// ```
class Role extends Jsonable {
  int id;
  String name;

  /// Constructor from 'raw data'
  Role({
    @required this.id,
    @required this.name,
  });

  Role.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Role.fromMap(final Map<String, dynamic> map) {
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
