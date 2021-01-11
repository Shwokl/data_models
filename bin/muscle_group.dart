// External Imports
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:meta/meta.dart' show required;

/// Encapsulates all the data associated to a muscle group, as described in the
/// database
///
/// ``` sql
/// `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `name` VARCHAR(32) UNIQUE NOT NULL,
/// `is_locked` BOOLEAN NOT NULL DEFAULT FALSE
/// ```
class MuscleGroup {
  int id;
  String name;
  bool isLocked;

  /// Constructor from 'raw data'
  MuscleGroup({
    @required this.id,
    @required this.name,
    @required this.isLocked,
  });

  MuscleGroup.fromJson(final String json) : this.fromMap(jsonDecode(json));
  MuscleGroup.fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['muscle_group_id']);
    name = map['muscle_group_name'];
    isLocked = map['muscle_group_is_locked'].toString() == '1';
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() {
    return {
      'muscle_group_id': id,
      'muscle_group_name': name,
      'muscle_group_is_locked': isLocked,
    };
  }
}
