// To parse this JSON data, do
//
//     final examprogramModel = examprogramModelFromJson(jsonString);

import 'dart:convert';

List<ExamprogramModel> examprogramModelFromJson(String str) => List<ExamprogramModel>.from(json.decode(str).map((x) => ExamprogramModel.fromJson(x)));

String examprogramModelToJson(List<ExamprogramModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamprogramModel {
    int id;
    String name;
    int type;
    DateTime date;
    Material material;
    Teacher teacher;
    Section section;
    Class examprogramModelClass;

    ExamprogramModel({
        required this.id,
        required this.name,
        required this.type,
        required this.date,
        required this.material,
        required this.teacher,
        required this.section,
        required this.examprogramModelClass,
    });

    factory ExamprogramModel.fromJson(Map<String, dynamic> json) => ExamprogramModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        date: DateTime.parse(json["date"]),
        material: Material.fromJson(json["material"]),
        teacher: Teacher.fromJson(json["teacher"]),
        section: Section.fromJson(json["section"]),
        examprogramModelClass: Class.fromJson(json["class"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "date": date.toIso8601String(),
        "material": material.toJson(),
        "teacher": teacher.toJson(),
        "section": section.toJson(),
        "class": examprogramModelClass.toJson(),
    };
}

class Class {
    int id;
    String name;

    Class({
        required this.id,
        required this.name,
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

class Material {
    int id;
    String name;
    int numChapter;

    Material({
        required this.id,
        required this.name,
        required this.numChapter,
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
    int id;
    String name;
    int size;
    dynamic supervisor;
    dynamic sectionClass;
    List<dynamic> teatchers;

    Section({
        required this.id,
        required this.name,
        required this.size,
        required this.supervisor,
        required this.sectionClass,
        required this.teatchers,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
        size: json["size"],
        supervisor: json["supervisor"],
        sectionClass: json["class"],
        teatchers: List<dynamic>.from(json["teatchers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "size": size,
        "supervisor": supervisor,
        "class": sectionClass,
        "teatchers": List<dynamic>.from(teatchers.map((x) => x)),
    };
}

class Teacher {
    int id;
    String firstName;
    String lastName;
    dynamic password;
    dynamic phoneNumber;
    dynamic email;
    dynamic material;
    dynamic section;

    Teacher({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.password,
        required this.phoneNumber,
        required this.email,
        required this.material,
        required this.section,
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
