// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';
import '../../../helpers/query_helper/components/categories/table.dart';

/// Encapsulates all the data associated to a category, as described in the
/// database
///
/// ```sql
/// `category_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `category_name` VARCHAR(64) UNIQUE NOT NULL
/// ```
class Category extends Jsonable {
  int id;
  String name;

  /// Constructor from 'raw data'
  Category({
    @required this.id,
    @required this.name,
  });

  Category.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Category.fromMap(final Map<String, dynamic> map) {
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
