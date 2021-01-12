import 'dart:convert';

class Jsonable {
  Jsonable fromJson(final String json) => fromMap(jsonDecode(json));
  Jsonable fromMap(final Map<String, dynamic> map) => null;

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() => null;
}
