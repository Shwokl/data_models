import '../workout_plans/table.dart' as wp;
import '../users/table.dart' as u;
import '../roles/table.dart' as r;

abstract class Table {
  static const String tableName = 'workouts';

  static const String id = 'workout_id';
  static const String name = 'workout_name';
  static const String image = 'workout_image';
  static const String workoutPlan = 'workout_plan_id';

  // TODO FIXME
  static const String defaultImage = '/path/to/default/image.png';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget = '$name, $image, $workoutPlan';

  /// Specifies the specific fields we want out of the `SELECT`, in order to avoid
  /// the big bad `SELECT *`
  static const String selectTarget = '''
    W.$id, W.$name, W.$image, W.$workoutPlan, WP.${wp.Table.name},
    WP.${wp.Table.description}, WP.${wp.Table.image}, WP.${wp.Table.creator},
    WP.${wp.Table.isPublic}, U.${u.Table.id}, U.${u.Table.name},
    U.${u.Table.username}, U.${u.Table.password}, U.${u.Table.spice},
    U.${u.Table.email}, U.${u.Table.role}, U.${u.Table.avatar},
    U.${u.Table.isActive}, R.${r.Table.name}
  ''';

  /// `JOIN`s together the `workouts`, `workout_plans`, `users` and `roles` tables,
  /// so that we can extract the "full" information about a workout
  static const String extendedTable = '''
    $tableName W
    LEFT JOIN ${wp.Table.tableName} WP ON
      (WP.${wp.Table.id} = W.$workoutPlan)
    LEFT JOIN ${u.Table.tableName} U ON
      (U.${u.Table.id} = WP.${wp.Table.creator})
    LEFT JOIN ${r.Table.tableName} R ON
      (R.${r.Table.id} = U.${u.Table.role})
  ''';
}
