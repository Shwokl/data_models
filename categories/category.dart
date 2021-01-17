// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import '../jsonable.dart';
import 'table.dart';

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
