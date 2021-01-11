// External Imports
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:meta/meta.dart' show required;

/// Encapsulates all the data associated to a workout access level, as described
/// in the database
///
/// ```sql
/// `access_level_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `access_level_name` VARCHAR(64) UNIQUE NOT NULL
/// ```
class AccessLevel {
  int id;
  String name;

  /// Constructor from 'raw data'
  AccessLevel({
    @required this.id,
    @required this.name,
  });

  AccessLevel.fromJson(final String json) : this.fromMap(jsonDecode(json));
  AccessLevel.fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['access_level_id']);
    name = map['access_level_name'];
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() {
    return {
      'access_level_id': id,
      'access_level_name': name,
    };
  }
}
