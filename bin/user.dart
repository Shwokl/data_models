// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import 'jsonable.dart';
import 'role.dart';
import '../../../helpers/query_helper/components/users/table.dart';

/// Encapsulates all the data associated to a user, as described in the database
///
/// ``` SQL
/// `user_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
/// `user_name` VARCHAR(128) DEFAULT NULL,
/// `user_username` VARCHAR(64) NOT NULL,
/// `user_password` VARCHAR(128) NOT NULL,
/// `user_spice` VARCHAR(128) NOT NULL,
/// `user_email` VARCHAR(128) UNIQUE NOT NULL,
/// `user_role_id` INTEGER,
/// `user_avatar` VARCHAR(256) DEFAULT NULL,
/// `user_is_active` BOOLEAN DEFAULT TRUE,
/// ```
class User extends Jsonable {
  int id;
  String name;
  String username;
  String password;
  String spice;
  String email;
  Role role;
  String avatar;
  bool isActive;

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
  });

  User.fromJson(final String json) : this.fromMap(jsonDecode(json));
  User.fromMap(final Map<String, dynamic> map) {
    if (map.containsKey(Table.id)) {
      id = int.parse(map[Table.id]);
    } else {
      id = 0;
    }
    name = map[Table.name];
    username = map[Table.username];
    password = map[Table.password];
    spice = map[Table.spice];
    email = map[Table.email];
    role = Role.fromMap(map);
    avatar = map[Table.avatar];
    isActive = map[Table.isActive];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> user = {
      Table.id: id,
      Table.name: name,
      Table.username: username,
      Table.password: password,
      Table.spice: spice,
      Table.email: email,
      Table.avatar: avatar,
      Table.isActive: isActive,
    };
    user.addAll(role.toMap());
    return user;
  }
}
