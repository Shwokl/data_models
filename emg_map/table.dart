class Table {
  static const String tableName = 'exercises_muscle_groups_map';

  static const String exercise = 'exercise_id';
  static const String muscleGroup = 'muscle_group_id';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget = '$exercise, $muscleGroup';
}
