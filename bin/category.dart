// External Imports
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:meta/meta.dart' show required;

/// Encapsulates all the data associated to a category, as described in the
/// database
///
/// ```sql
/// `category_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `category_name` VARCHAR(64) UNIQUE NOT NULL
/// ```
class Category {
  int id;
  String name;

  /// Constructor from 'raw data'
  Category({
    @required this.id,
    @required this.name,
  });

  Category.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Category.fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['category_id']);
    name = map['category_name'];
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() {
    return {
      'category_id': id,
      'category_name': name,
    };
  }
}
