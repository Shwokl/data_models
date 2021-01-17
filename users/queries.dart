import 'table.dart' as u;

class Queries {
  final String defaultRole = '2';
  final String defaultAvatar = '/path/to/default/avatar.png'; // TODO FIXME

  /// Creates a new entry in the table, with the given values, IN THIS PARTICULAR
  /// ORDER: name, username, password, spice, email, role_id, avatar, is_active
  final String insert = '''
    INSERT INTO ${u.Table.tableName} (${u.Table.insertTarget})
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  ''';

  /// Updates the entry, with the fields IN THIS PARTICULAR ORDER:
  /// name, username, email, roleId, avatar, id
  final String update = '''
    UPDATE ${u.Table.tableName}
    SET ${u.Table.name} = ?,
        ${u.Table.username} = ?,
        ${u.Table.email} = ?,
        ${u.Table.role} = ?,
        ${u.Table.avatar} = ?,
    WHERE U.${u.Table.id} = ?;
  ''';

  final String changePassword = '''
    UPDATE ${u.Table.tableName}
    SET ${u.Table.password} = ?,
        ${u.Table.spice} = ?
    WHERE U.${u.Table.id} = ?;
  ''';

  final String deactivateUser = '''
    UPDATE ${u.Table.tableName}
    SET ${u.Table.isActive} = 0
    WHERE U.${u.Table.id} = ?;
  ''';

  final String delete = '''
    DELETE FROM ${u.Table.tableName}
    WHERE ${u.Table.id} = ?
    LIMIT 1;
  ''';

  final String getById = '''
      SELECT ${u.Table.selectTarget}
      FROM ${u.Table.extendedTable}
      WHERE U.${u.Table.id} = ?;
  ''';

  final String getAll = '''
      SELECT ${u.Table.selectTarget}
      FROM ${u.Table.extendedTable};
  ''';

  final String checkUsernameTaken = '''
    SELECT COUNT(${u.Table.username}) AS "count"
    FROM ${u.Table.tableName}
    WHERE ${u.Table.username} = ?
    AND ${u.Table.id} != ?;
  ''';

  final String getPasswordForUser = '''
    SELECT ${u.Table.password}
    FROM ${u.Table.tableName} U
    WHERE ${u.Table.username} = ?
  ''';
}
