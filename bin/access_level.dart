// External Imports
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';

/// Encapsulates all the data associated to a workout access level, as described
/// in the database
///
/// ```sql
/// `access_level_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `access_level_name` VARCHAR(64) UNIQUE NOT NULL
/// ```
class AccessLevel extends Jsonable {
  int id;
  String name;

  /// Constructor from 'raw data'
  AccessLevel({
    @required this.id,
    @required this.name,
  });

  @override
  AccessLevel fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['access_level_id']);
    name = map['access_level_name'];
    return this;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'access_level_id': id,
      'access_level_name': name,
    };
  }
}
