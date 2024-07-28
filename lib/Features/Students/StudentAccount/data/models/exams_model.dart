// To parse this JSON data, do
//
//     final userExamsModel = userExamsModelFromJson(jsonString);

import 'dart:convert';

List<UserExamsModel> userExamsModelFromJson(String str) =>
    List<UserExamsModel>.from(
        json.decode(str).map((x) => UserExamsModel.fromJson(x)));

String userExamsModelToJson(List<UserExamsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserExamsModel {
  final int? id;
  final String? name;
  final int? type;
  final DateTime? date;
  final Material? material;
  final Teacher? teacher;
  final Section? section;
  final Class? userExamsModelClass;

  UserExamsModel({
    this.id,
    this.name,
    this.type,
    this.date,
    this.material,
    this.teacher,
    this.section,
    this.userExamsModelClass,
  });

  factory UserExamsModel.fromJson(Map<String, dynamic> json) => UserExamsModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        material: json["material"] == null
            ? null
            : Material.fromJson(json["material"]),
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
        section:
            json["section"] == null ? null : Section.fromJson(json["section"]),
        userExamsModelClass:
            json["class"] == null ? null : Class.fromJson(json["class"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "date": date?.toIso8601String(),
        "material": material?.toJson(),
        "teacher": teacher?.toJson(),
        "section": section?.toJson(),
        "class": userExamsModelClass?.toJson(),
      };
}

class Material {
  final int? id;
  final String? name;
  final int? numChapter;

  Material({
    this.id,
    this.name,
    this.numChapter,
  });

  factory Material.fromJson(Map<String, dynamic> json) => Material(
        id: json["id"],
        name: json["name"],
        numChapter: json["numChapter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "numChapter": numChapter,
      };
}

class Section {
  final int? id;
  final String? name;
  final int? size;
  final dynamic supervisor;
  final dynamic sectionClass;
  final List<dynamic>? teatchers;

  Section({
    this.id,
    this.name,
    this.size,
    this.supervisor,
    this.sectionClass,
    this.teatchers,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
        size: json["size"],
        supervisor: json["supervisor"],
        sectionClass: json["class"],
        teatchers: json["teatchers"] == null
            ? []
            : List<dynamic>.from(json["teatchers"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "size": size,
        "supervisor": supervisor,
        "class": sectionClass,
        "teatchers": teatchers == null
            ? []
            : List<dynamic>.from(teatchers!.map((x) => x)),
      };
}

class Teacher {
  final int? id;
  final String? firstName;
  final String? lastName;
  final dynamic password;
  final dynamic phoneNumber;
  final dynamic email;
  final dynamic material;
  final dynamic section;

  Teacher({
    this.id,
    this.firstName,
    this.lastName,
    this.password,
    this.phoneNumber,
    this.email,
    this.material,
    this.section,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        material: json["material"],
        section: json["section"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "phoneNumber": phoneNumber,
        "email": email,
        "material": material,
        "section": section,
      };
}

class Class {
  final int? id;
  final String? name;

  Class({
    this.id,
    this.name,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
