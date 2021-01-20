import '../roles/table.dart' as r;
import '../users/table.dart' as u;

abstract class Table {
  static const String tableName = 'workout_plans';

  static const String id = 'workout_plan_id';
  static const String name = 'workout_plan_name';
  static const String description = 'workout_plan_description';
  static const String image = 'workout_plan_image';
  static const String creator = 'creator_id';
  static const String isPublic = 'workout_plan_is_public';

  // TODO FIXME
  static const String defaultImage = '/path/to/default/image.png';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget =
      '$name, $description, $image, $creator, $isPublic';

  /// Specifies the specific fields we want out of the `SELECT`, in order to avoid
  /// the big bad `SELECT *`
  static const String selectTarget = '''
    WP.$id, WP.$name, WP.$description, WP.$image, WP.$creator, WP.$isPublic, 
    U.${u.Table.id}, U.${u.Table.name}, U.${u.Table.username}, 
    U.${u.Table.password}, U.${u.Table.spice}, U.${u.Table.email},
    U.${u.Table.role}, U.${u.Table.avatar}, U.${u.Table.isActive},
    R.${r.Table.name}
  ''';

  /// `JOIN`s together the `workout_plans`, `users` and `roles` table, so that we
  /// can extract the "full" information about a workout log (the creator name too)
  static const String extendedTable = '''
    $tableName WP
    LEFT JOIN ${u.Table.tableName} U ON
      (U.${u.Table.id} = WP.$creator)
    LEFT JOIN ${r.Table.tableName} R ON
      (R.${r.Table.id} = U.${u.Table.role})
  ''';
}
