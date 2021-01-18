// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import '../insertable.dart';
import '../jsonable.dart';
import 'table.dart';
import '../categories/category.dart';

/// Encapsulates all the data associated to a role, as described in the database
///
/// ``` sql
/// `exercise_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `exercise_name` VARCHAR(128) UNIQUE NOT NULL,
/// `exercise_description` VARCHAR(512) DEFAULT NULL,
/// `exercise_notes` VARCHAR(1024) DEFAULT NULL,
/// `exercise_icon` VARCHAR(256) DEFAULT NULL,
/// `exercise_category_id` INTEGER
/// ```
class Exercise extends Jsonable with Insertable {
  int id;
  String name;
  String description;
  String notes;
  String icon;
  Category category;

  /// Constructor from 'raw data'
  Exercise({
    @required this.id,
    @required this.name,
    this.description = '',
    this.notes = '',
    this.icon = Table.defaultIcon,
    @required this.category,
  });

  Exercise.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Exercise.fromMap(final Map<String, dynamic> map) {
    id = int.parse(Jsonable.tryExtract(map, Table.id, '0'));
    name = map[Table.name];
    description = Jsonable.tryExtract(map, Table.description, '');
    notes = Jsonable.tryExtract(map, Table.notes, '');
    icon = Jsonable.tryExtract(map, Table.icon, Table.defaultIcon);
    category = Category.fromMap(map);
  }

  @override
  bool hasDataForUpdate() => hasDataForInsert() && id != null && id > 0;
  @override
  bool hasDataForInsert() {
    return this != null &&
        name != null &&
        name.isNotEmpty &&
        category != null &&
        category.id != null &&
        category.id > 0;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> exercise = {
      Table.id: id,
      Table.name: name,
      Table.description: description,
      Table.notes: notes,
      Table.icon: icon,
    };
    exercise.addAll(category.toMap());
    return exercise;
  }

  @override
  List<dynamic> toInsertArray() =>
      [name, description, notes, icon, category.id];

  @override
  List<dynamic> toUpdateArray() =>
      [name, description, notes, icon, category.id, id];
}
