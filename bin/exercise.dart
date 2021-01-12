// External Imports
import 'package:meta/meta.dart' show required;

// Local imports
import 'category.dart';
import 'jsonable.dart';
import 'muscle_group.dart';

/// Encapsulates all the data associated to a role, as described in the database
///
/// ``` sql
/// `exercise_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `exercise_name` VARCHAR(128) UNIQUE NOT NULL,
/// `exercise_description` VARCHAR(512) DEFAULT NULL,
/// `exercise_notes` VARCHAR(1024) DEFAULT NULL,
/// `exercise_icon` VARCHAR(256) DEFAULT NULL,
/// `exercise_muscle_group_id` INTEGER DEFAULT 1,
/// `exercise_category_id` INTEGER
/// ```
class Exercise extends Jsonable {
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

  @override
  Exercise fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['exercise_id']);
    name = map['exercise_name'];
    description = map['exercise_description'];
    notes = map['exercise_notes'];
    icon = map['exercise_icon'];
    muscleGroup = muscleGroup.fromMap(map);
    category = category.fromMap(map);
    return this;
  }

  @override
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
