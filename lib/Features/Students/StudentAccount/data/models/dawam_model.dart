// To parse this JSON data, do
//
//     final userDawamModel = userDawamModelFromJson(jsonString);

import 'dart:convert';

List<UserDawamModel> userDawamModelFromJson(String str) =>
    List<UserDawamModel>.from(
        json.decode(str).map((x) => UserDawamModel.fromJson(x)));

String userDawamModelToJson(List<UserDawamModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDawamModel {
  final Student? student;
  final String? note;
  final DateTime? date;
  final bool? isPresent;
  final int? presentPercentage;

  UserDawamModel({
    this.student,
    this.note,
    this.date,
    this.isPresent,
    this.presentPercentage,
  });

  factory UserDawamModel.fromJson(Map<String, dynamic> json) => UserDawamModel(
        student:
            json["student"] == null ? null : Student.fromJson(json["student"]),
        note: json["note"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        isPresent: json["isPresent"],
        presentPercentage: json["presentPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "student": student?.toJson(),
        "note": note,
        "date": date?.toIso8601String(),
        "isPresent": isPresent,
        "presentPercentage": presentPercentage,
      };
}

class Student {
  final int? id;
  final String? firstName;
  final String? lastName;
  final Parent? parent;

  Student({
    this.id,
    this.firstName,
    this.lastName,
    this.parent,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "parent": parent?.toJson(),
      };
}

class Parent {
  final int? id;
  final String? fatherName;
  final dynamic motherName;
  final dynamic phoneNumber;
  final dynamic email;

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
