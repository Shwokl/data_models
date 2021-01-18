abstract class Table {
  static const String tableName = 'users_workout_plans_map';

  static const String user = 'user_id';
  static const String workoutPlan = 'workout_plan_id';
  static const String isPrimary = 'is_primary';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget = '$user, $workoutPlan, $isPrimary';
}
