// External Imports
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:meta/meta.dart' show required;

/// Encapsulates all the data associated to a role, as described in the database
///
/// ``` sql
/// `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `name` VARCHAR(32) UNIQUE NOT NULL,
/// `is_locked` BOOLEAN NOT NULL DEFAULT FALSE
/// ```
class Role {
  int id;
  String name;
  bool isLocked;

  /// Constructor from 'raw data'
  Role({
    @required this.id,
    @required this.name,
    @required this.isLocked,
  });

  Role.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Role.fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['role_id']);
    name = map['role_name'];
    isLocked = map['role_is_locked'].toString() == '1';
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() {
    return {
      'role_id': id,
      'role_name': name,
      'role_is_locked': isLocked,
    };
  }
}
