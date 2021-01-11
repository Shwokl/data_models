// External Imports
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'role.dart';
import 'workout_plan.dart';

/// Encapsulates all the data associated to a user, as described in the database
///
/// ``` SQL
/// `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `name` VARCHAR(128) DEFAULT NULL,
/// `username` VARCHAR(64) NOT NULL,
/// `password` VARCHAR(128) NOT NULL,
/// `spice` VARCHAR(128) NOT NULL,
/// `email` VARCHAR(128) UNIQUE NOT NULL,
/// `role_id` INTEGER,
/// `avatar` VARCHAR(256) DEFAULT NULL,
/// `is_active` BOOLEAN DEFAULT TRUE,
/// `active_workout_plan_id` INTEGER DEFAULT NULL
/// ```
class User {
  int id;
  String name;
  String username;
  String password;
  String spice;
  String email;
  Role role;
  String avatar;
  bool isActive;
  WorkoutPlan activePlan;

  User({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.password,
    @required this.spice,
    @required this.email,
    @required this.role,
    @required this.avatar,
    @required this.isActive,
    @required this.activePlan,
  });

  User.fromJson(final String json) : this.fromMap(jsonDecode(json));
  User.fromMap(final Map<String, dynamic> map) {
    id = int.parse(map['user_id']);
    name = map['user_name'];
    username = map['user_username'];
    password = map['user_password'];
    spice = map['user_spice'];
    email = map['user_email'];
    role = Role.fromMap(map);
    avatar = map['user_avatar'];
    isActive = map['user_isActive'];
    activePlan = WorkoutPlan.fromMap(map);
  }

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() {
    Map<String, dynamic> user = {
      'user_id': id,
      'user_name': name,
      'user_username': username,
      'user_password': password,
      'user_spice': spice,
      'user_email': email,
      'user_avatar': avatar,
      'user_isActive': isActive,
    };
    user.addAll(role.toMap());
    user.addAll(activePlan.toMap());
    return user;
  }
}
