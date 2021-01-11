// External Imports
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'category.dart';
import 'muscle_group.dart';

/// Encapsulates all the data associated to a role, as described in the database
///
/// ``` sql
/// `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `name` VARCHAR(128) UNIQUE NOT NULL,
/// `description` VARCHAR(512) DEFAULT NULL,
/// `notes` VARCHAR(1024) DEFAULT NULL,
/// `icon` VARCHAR(256) DEFAULT NULL,
/// `muscle_group_id` INTEGER DEFAULT 1,
/// `category_id` INTEGER
/// ```
class Exercise {
  int id;
  String name;
  String description;
  String notes;
  String icon;
  MuscleGroup muscleGroup;
  Category category;

  /// Constructor from 'raw data'
  Exercise({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.notes,
    @required this.icon,
    @required this.muscleGroup,
    @required this.category,
  });

  Exercise.fromJson(final String json) : this.fromMap(jsonDecode(json));
  Exercise.fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['exercise_id']);
    name = map['exercise_name'];
    description = map['exercise_description'];
    notes = map['exercise_notes'];
    icon = map['exercise_icon'];
    muscleGroup = MuscleGroup.fromMap(map);
    category = Category.fromMap(map);
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() {
    Map<String, dynamic> exercise = {
      'exercise_id': id,
      'exercise_name': name,
      'exercise_description': description,
      'exercise_notes': notes,
      'exercise_icon': icon,
    };
    exercise.addAll(muscleGroup.toMap());
    exercise.addAll(category.toMap());
    return exercise;
  }
}
