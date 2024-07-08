// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final DateTime? birtDate;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final Class? userModelClass;
  final Class? section;
  final Parent? parent;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.birtDate,
    this.phoneNumber,
    this.email,
    this.password,
    this.userModelClass,
    this.section,
    this.parent,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birtDate:
            json["birtDate"] == null ? null : DateTime.parse(json["birtDate"]),
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        userModelClass:
            json["class"] == null ? null : Class.fromJson(json["class"]),
        section:
            json["section"] == null ? null : Class.fromJson(json["section"]),
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "birtDate": birtDate?.toIso8601String(),
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "class": userModelClass?.toJson(),
        "section": section?.toJson(),
        "parent": parent?.toJson(),
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
