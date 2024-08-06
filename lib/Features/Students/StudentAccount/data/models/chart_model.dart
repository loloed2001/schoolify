// To parse this JSON data, do
//
//     final getChartsModel = getChartsModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final getStudentInfoResponseModel = getStudentInfoResponseModelFromJson(jsonString);

import 'dart:convert';

List<GetStudentInfoResponseModel> getStudentInfoResponseModelFromJson(
        String str) =>
    List<GetStudentInfoResponseModel>.from(
        json.decode(str).map((x) => GetStudentInfoResponseModel.fromJson(x)));

String getStudentInfoResponseModelToJson(
        List<GetStudentInfoResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudentInfoResponseModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final DateTime? birtDate;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final Class? getStudentInfoResponseModelClass;
  final Class? section;
  final Parent? parent;
  final int? isPresent;
  final int? allPresent;
  final int? percentAge;
  final DateTime? creationDate;
  final int? mark;

  GetStudentInfoResponseModel({
    this.id,
    this.firstName,
    this.lastName,
    this.birtDate,
    this.phoneNumber,
    this.email,
    this.password,
    this.getStudentInfoResponseModelClass,
    this.section,
    this.parent,
    this.isPresent,
    this.allPresent,
    this.percentAge,
    this.creationDate,
    this.mark,
  });

  factory GetStudentInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      GetStudentInfoResponseModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birtDate:
            json["birtDate"] == null ? null : DateTime.parse(json["birtDate"]),
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        getStudentInfoResponseModelClass:
            json["class"] == null ? null : Class.fromJson(json["class"]),
        section:
            json["section"] == null ? null : Class.fromJson(json["section"]),
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
        "class": getStudentInfoResponseModelClass?.toJson(),
        "section": section?.toJson(),
        "parent": parent?.toJson(),
        "isPresent": isPresent,
        "allPresent": allPresent,
        "percentAge": percentAge,
        "creationDate": creationDate?.toIso8601String(),
        "mark": mark,
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

class Parent {
  final int? id;
  final String? fatherName;
  final String? motherName;
  final String? phoneNumber;
  final String? email;
  final dynamic password;

  Parent({
    this.id,
    this.fatherName,
    this.motherName,
    this.phoneNumber,
    this.email,
    this.password,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
        fatherName: json["fatherName"],
        motherName: json["motherName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fatherName": fatherName,
        "motherName": motherName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
      };
}

GetChartsModel getChartsModelFromJson(String str) =>
    GetChartsModel.fromJson(json.decode(str));

String getChartsModelToJson(GetChartsModel data) => json.encode(data.toJson());

class GetChartsModel {
  final double? markAverage;
  final double? isPresentPercentage;

  GetChartsModel({
    this.markAverage,
    this.isPresentPercentage,
  });

  factory GetChartsModel.fromJson(Map<String, dynamic> json) => GetChartsModel(
        markAverage: json["markAverage"]?.toDouble(),
        isPresentPercentage: json["isPresentPercentage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "markAverage": markAverage,
        "isPresentPercentage": isPresentPercentage,
      };
}
