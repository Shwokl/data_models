// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'category.dart';
import 'jsonable.dart';
import '../../../helpers/query_helper/components/exercises/table.dart';

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
class Exercise extends Jsonable {
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
    @required this.description,
    @required this.notes,
    @required this.icon,
    @required this.category,
  });

  Exercise.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Exercise.fromMap(final Map<String, dynamic> map) {
    if (map.containsKey(Table.id)) {
      id = int.parse(map[Table.id]);
    } else {
      id = 0;
    }
    name = map[Table.name];
    description = map[Table.description];
    notes = map[Table.notes];
    icon = map[Table.icon];
    category = Category.fromMap(map);
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
}
