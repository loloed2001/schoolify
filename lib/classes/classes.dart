import 'dart:convert';

class Classes {
  final int? id;
  final String? name;

  const Classes({this.id, this.name});

  factory Classes.fromMap(Map<String, dynamic> data) => Classes(
        id: data['id'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Classes].
  factory Classes.fromJson(String data) {
    return Classes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Classes] to a JSON string.
  String toJson() => json.encode(toMap());

  Classes copyWith({
    int? id,
    String? name,
  }) {
    return Classes(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
