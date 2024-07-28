// To parse this JSON data, do
//
//     final indexPostsModel = indexPostsModelFromJson(jsonString);

import 'dart:convert';

List<PostsModel> indexPostsModelFromJson(String str) =>
    List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String indexPostsModelToJson(List<PostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModel {
  final String? title;
  final String? description;
  final String? image;
  final DateTime? createDate;
  final Supervisor? supervisor;
  final List<Section>? sections;

  PostsModel({
    this.title,
    this.description,
    this.image,
    this.createDate,
    this.supervisor,
    this.sections,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        supervisor: json["supervisor"] == null
            ? null
            : Supervisor.fromJson(json["supervisor"]),
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image": image,
        "createDate": createDate?.toIso8601String(),
        "supervisor": supervisor?.toJson(),
        "sections": sections == null
            ? []
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
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
