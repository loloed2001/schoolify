// To parse this JSON data, do
//
//     final authmodel = authmodelFromJson(jsonString);

import 'dart:convert';

Authmodel authmodelFromJson(String str) => Authmodel.fromJson(json.decode(str));

String authmodelToJson(Authmodel data) => json.encode(data.toJson());

class Authmodel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final DateTime? birtDate;
  final String? phoneNumber;
  final String? email;

  Authmodel({
    this.id,
    this.firstName,
    this.lastName,
    this.birtDate,
    this.phoneNumber,
    this.email,
  });

  factory Authmodel.fromJson(Map<String, dynamic> json) => Authmodel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birtDate:
            json["birtDate"] == null ? null : DateTime.parse(json["birtDate"]),
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "birtDate": birtDate?.toIso8601String(),
        "phoneNumber": phoneNumber,
        "email": email,
      };
}

// To parse this JSON data, do

//     final authmodel = authmodelFromJson(jsonString);

// import 'dart:convert';

// Authmodel authmodelFromJson(String str) => Authmodel.fromJson(json.decode(str));

// String authmodelToJson(Authmodel data) => json.encode(data.toJson());

// class Authmodel {
//   final String? token;

//   Authmodel({
//     this.token,
//   });

//   factory Authmodel.fromJson(Map<String, dynamic> json) => Authmodel(
//         token: json["token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "token": token,
//       };
// }
