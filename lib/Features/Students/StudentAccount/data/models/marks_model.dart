// To parse this JSON data, do
//
//     final marksResponseModel = marksResponseModelFromJson(jsonString);

import 'dart:convert';

List<MarksResponseModel> marksResponseModelFromJson(String str) =>
    List<MarksResponseModel>.from(
        json.decode(str).map((x) => MarksResponseModel.fromJson(x)));

String marksResponseModelToJson(List<MarksResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarksResponseModel {
  final int? id;
  final int? mark;
  final int? type;
  final DateTime? date;
  final Student? student;
  final dynamic teatcher;
  final Material? material;

  MarksResponseModel({
    this.id,
    this.mark,
    this.type,
    this.date,
    this.student,
    this.teatcher,
    this.material,
  });

  factory MarksResponseModel.fromJson(Map<String, dynamic> json) =>
      MarksResponseModel(
        id: json["id"],
        mark: json["mark"],
        type: json["type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        student:
            json["student"] == null ? null : Student.fromJson(json["student"]),
        teatcher: json["teatcher"],
        material: json["material"] == null
            ? null
            : Material.fromJson(json["material"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mark": mark,
        "type": type,
        "date": date?.toIso8601String(),
        "student": student?.toJson(),
        "teatcher": teatcher,
        "material": material?.toJson(),
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

class Student {
  final int? id;
  final String? firstName;
  final String? lastName;
  final DateTime? birtDate;
  final String? phoneNumber;
  final dynamic email;
  final dynamic password;
  final Class? studentClass;
  final dynamic section;
  final Parent? parent;
  final int? isPresent;
  final int? allPresent;
  final int? percentAge;
  final DateTime? creationDate;
  final int? mark;

  Student({
    this.id,
    this.firstName,
    this.lastName,
    this.birtDate,
    this.phoneNumber,
    this.email,
    this.password,
    this.studentClass,
    this.section,
    this.parent,
    this.isPresent,
    this.allPresent,
    this.percentAge,
    this.creationDate,
    this.mark,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birtDate:
            json["birtDate"] == null ? null : DateTime.parse(json["birtDate"]),
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        studentClass:
            json["class"] == null ? null : Class.fromJson(json["class"]),
        section: json["section"],
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        isPresent: json["isPresent"],
        allPresent: json["allPresent"],
        percentAge: json["percentAge"],
        creationDate: json["creationDate"] == null
            ? null
            : DateTime.parse(json["creationDate"]),
        mark: json["mark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "birtDate": birtDate?.toIso8601String(),
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "class": studentClass?.toJson(),
        "section": section,
        "parent": parent?.toJson(),
        "isPresent": isPresent,
        "allPresent": allPresent,
        "percentAge": percentAge,
        "creationDate": creationDate?.toIso8601String(),
        "mark": mark,
      };
}

class Parent {
  final int? id;
  final String? fatherName;
  final String? motherName;
  final String? phoneNumber;
  final String? email;

  Parent({
    this.id,
    this.fatherName,
    this.motherName,
    this.phoneNumber,
    this.email,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
        fatherName: json["fatherName"],
        motherName: json["motherName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fatherName": fatherName,
        "motherName": motherName,
        "phoneNumber": phoneNumber,
        "email": email,
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
