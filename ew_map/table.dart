class Table {
  static const String tableName = 'exercises_workouts_map';

  static const String exercise = 'exercise_id';
  static const String workout = 'workout_id';
  static const String sets = 'sets';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget = '$exercise, $workout, $sets';
}
