// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

//Local import
import '../insertable.dart';
import '../jsonable.dart';
import 'table.dart';
import '../users/user.dart';

/// Encapsulates all the data associated to a workout plan, as described in the
/// database
///
/// ``` sql
/// `workout_plan_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `workout_plan_name` VARCHAR(128) NOT NULL,
/// `workout_plan_description` VARCHAR(512) DEFAULT NULL,
/// `workout_plan_image` VARCHAR(256) DEFAULT NULL,
/// `workout_plan_creator_id` INTEGER NOT NULL,
/// `workout_plan_is_public` BOOLEAN NOT NULL DEFAULT FALSE
/// ```
class WorkoutPlan extends Jsonable with Insertable {
  int id;
  String name;
  String description;
  String image;
  User creator;
  int isPublic;

  WorkoutPlan({
    @required this.id,
    @required this.name,
    this.description = '',
    this.image = Table.defaultImage,
    @required this.creator,
    this.isPublic = 0,
  });

  WorkoutPlan.fromJson(final String json) : this.fromMap(jsonDecode(json));
  WorkoutPlan.fromMap(final Map<String, dynamic> map) {
    id = int.parse(Jsonable.tryExtract(map, Table.id, '0'));
    name = map[Table.name];
    description = Jsonable.tryExtract(map, Table.description, '');
    image = Jsonable.tryExtract(map, Table.image, Table.defaultImage);
    isPublic = int.parse(Jsonable.tryExtract(map, Table.isPublic, '0'));
    creator = User.fromMap(map);
    if (creator.id == 0) {
      creator.id = int.parse(Jsonable.tryExtract(map, Table.creator, '0'));
    }
  }

  @override
  bool hasDataForUpdate() => hasDataForInsert() && id != null && id > 0;
  @override
  bool hasDataForInsert() {
    return this != null &&
        name != null &&
        name.isNotEmpty &&
        creator != null &&
        creator.id != null &&
        creator.id > 0;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> workout_plan = {
      Table.id: id,
      Table.name: name,
      Table.description: description,
      Table.image: image,
      Table.isPublic: isPublic,
      Table.creator: creator.id,
    };
    workout_plan.addAll(creator.toMap());
    return workout_plan;
  }

  @override
  List<dynamic> toInsertArray() =>
      [name, description, image, creator.id, isPublic];
  @override
  List<dynamic> toUpdateArray() => [name, description, image, isPublic, id];
}
