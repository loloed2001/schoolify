// To parse this JSON data, do
//
//     final getNotesModel = getNotesModelFromJson(jsonString);

import 'dart:convert';

List<GetNotesModel> getNotesModelFromJson(String str) =>
    List<GetNotesModel>.from(
        json.decode(str).map((x) => GetNotesModel.fromJson(x)));

String getNotesModelToJson(List<GetNotesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetNotesModel {
  final String? description;
  final Supervisor? supervisor;
  final DateTime? createDate;
  final List<Student>? students;

  GetNotesModel({
    this.description,
    this.supervisor,
    this.createDate,
    this.students,
  });

  factory GetNotesModel.fromJson(Map<String, dynamic> json) => GetNotesModel(
        description: json["description"],
        supervisor: json["supervisor"] == null
            ? null
            : Supervisor.fromJson(json["supervisor"]),
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        students: json["students"] == null
            ? []
            : List<Student>.from(
                json["students"]!.map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "supervisor": supervisor?.toJson(),
        "createDate": createDate?.toIso8601String(),
        "students": students == null
            ? []
            : List<dynamic>.from(students!.map((x) => x.toJson())),
      };
}

class Student {
  final int? id;
  final String? firstName;
  final String? lastName;
  final DateTime? birtDate;
  final dynamic phoneNumber;
  final dynamic email;
  final dynamic password;
  final dynamic studentClass;
  final dynamic section;
  final dynamic parent;
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
        studentClass: json["class"],
        section: json["section"],
        parent: json["parent"],
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
        "class": studentClass,
        "section": section,
        "parent": parent,
        "isPresent": isPresent,
        "allPresent": allPresent,
        "percentAge": percentAge,
        "creationDate": creationDate?.toIso8601String(),
        "mark": mark,
      };
}

class Supervisor {
  final int? id;
  final String? firstName;
  final String? lastName;
  final dynamic password;
  final dynamic phoneNumber;
  final dynamic email;

  Supervisor({
    this.id,
    this.firstName,
    this.lastName,
    this.password,
    this.phoneNumber,
    this.email,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) => Supervisor(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}
