// External imports
import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart' show required;

// Local imports
import '../jsonable.dart';
import 'table.dart';
import '../roles/role.dart';

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
  int isActive;

  User({
    @required this.id,
    this.name = '',
    @required this.username,
    @required this.password,
    @required this.spice,
    this.email = '',
    @required this.role,
    this.avatar = Table.defaultAvatar,
    this.isActive = 1,
  });

  User.fromJson(final String json) : this.fromMap(jsonDecode(json));
  User.fromMap(final Map<String, dynamic> map) {
    id = int.parse(Jsonable.tryExtract(map, Table.id, '0'));
    name = Jsonable.tryExtract(map, Table.name, '');
    username = map[Table.username];
    password = map[Table.password];
    spice = map[Table.spice];
    email = Jsonable.tryExtract(map, Table.email, '');
    role = Role.fromMap(map);
    avatar = Jsonable.tryExtract(map, Table.avatar, Table.defaultAvatar);
    isActive = int.parse(Jsonable.tryExtract(map, Table.isActive, '1'));
  }

  @override
  bool hasDataForUpdate() => hasDataForInsert() && id != null && id > 0;
  @override
  bool hasDataForInsert() {
    return this != null &&
        name != null &&
        name.isNotEmpty &&
        username != null &&
        username.isNotEmpty &&
        password != null &&
        password.isNotEmpty &&
        spice != null &&
        spice.isNotEmpty &&
        role != null &&
        role.id != null &&
        role.id > 0;
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
