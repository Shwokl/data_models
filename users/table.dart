import '../roles/table.dart' as r;

abstract class Table {
  static const String tableName = 'users';

  static const String id = 'user_id';
  static const String name = 'user_name';
  static const String username = 'user_username';
  static const String password = 'user_password';
  static const String spice = 'user_spice';
  static const String email = 'user_email';
  static const String role = 'role_id';
  static const String avatar = 'user_avatar';
  static const String isActive = 'user_is_active';

  // TODO FIXME
  static const String defaultAvatar = '/path/to/default/avatar.png';

  /// Specifies all the fields needed when we insert information into the database
  /// Usually, this specifies all the fields the table, except the `id`, as that
  /// auto-increments
  static const String insertTarget =
      '$name, $username, $password, $spice, $email, $role, $avatar, $isActive';

  /// Specifies the specific fields we want out of the `SELECT`, in order to avoid
  /// the big bad `SELECT *`
  static const String selectTarget =
      '$id, $name, $username, $password, $spice, $email, $role, $avatar, $isActive, $name';

  /// `JOIN`s together the `users` and `roles` table, so that we can
  /// extract the "full" information about an exercise (the role name too)
  static const String extendedTable = '''
    $tableName U
    LEFT JOIN ${r.Table.tableName} R ON
      (R.${r.Table.id} = U.${role})
  ''';
}
