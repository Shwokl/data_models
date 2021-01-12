// External imports
import 'dart:convert' show jsonEncode;

// Local imports
import 'access_level.dart';
import 'category.dart';
import 'exercise.dart';
import 'log_entry.dart';
import 'muscle_group.dart';
import 'role.dart';
import 'user.dart';
import 'workout.dart';
import 'workout_log.dart';
import 'workout_plan.dart';

abstract class Jsonable {
  /// Add factory functions for every Type and every constructor you want to make available to `make`
  static final factories = <Type, Function>{
    AccessLevel: (String json) => AccessLevel.fromJson(json),
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

  static T fromJson<T extends Jsonable>(final String json) =>
      factories[T](json);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap();
}
