// External Imports
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';

/// Encapsulates all the data associated to a role, as described in the database
///
/// ``` sql
/// `role_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `role_name` VARCHAR(32) UNIQUE NOT NULL,
/// `role_is_locked` BOOLEAN NOT NULL DEFAULT FALSE
/// ```
class Role extends Jsonable {
  int id;
  String name;
  bool isLocked;

  /// Constructor from 'raw data'
  Role({
    @required this.id,
    @required this.name,
    @required this.isLocked,
  });

  @override
  Role fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['role_id']);
    name = map['role_name'];
    isLocked = map['role_is_locked'].toString() == '1';
    return this;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'role_id': id,
      'role_name': name,
      'role_is_locked': isLocked,
    };
  }
}
