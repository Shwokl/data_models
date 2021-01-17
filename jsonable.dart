// External imports
import 'dart:convert' show jsonEncode;

// Local imports
import 'categories/category.dart';
import 'exercises/exercise.dart';
import 'log_entries/log_entry.dart';
import 'muscle_groups/muscle_group.dart';
import 'roles/role.dart';
import 'users/user.dart';
import 'workouts/workout.dart';
import 'workout_logs/workout_log.dart';
import 'workout_plans/workout_plan.dart';

abstract class Jsonable {
  /// Add factory functions for every Type and every constructor you want to make available to `make`
  static final factories = <Type, Function>{
    Category: (String json) => Category.fromJson(json),
    Exercise: (String json) => Exercise.fromJson(json),
    LogEntry: (String json) => LogEntry.fromJson(json),
    MuscleGroup: (String json) => MuscleGroup.fromJson(json),
    Role: (String json) => Role.fromJson(json),
    User: (String json) => User.fromJson(json),
    WorkoutLog: (String json) => WorkoutLog.fromJson(json),
    WorkoutPlan: (String json) => WorkoutPlan.fromJson(json),
    Workout: (String json) => Workout.fromJson(json),
  };

  static T fromJson<T extends Jsonable>(final String json) {
    return factories[T](json);
  }

  static String tryExtract(final Map<String, dynamic> map, final String key,
      final String defaultValue) {
    if (map.containsKey(key)) {
      if (map[key] == null) {
        return defaultValue;
      }
      return map[key];
    }
    return defaultValue;
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap();
  bool hasDataForInsert();
  bool hasDataForUpdate();
}
