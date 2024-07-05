// To parse this JSON data, do
//
//     final weekprogramModel = weekprogramModelFromJson(jsonString);

import 'dart:convert';

List<WeekprogramModel> weekprogramModelFromJson(String str) => List<WeekprogramModel>.from(json.decode(str).map((x) => WeekprogramModel.fromJson(x)));

String weekprogramModelToJson(List<WeekprogramModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeekprogramModel {
    Material material;
    int day;
    String hour;

    WeekprogramModel({
        required this.material,
        required this.day,
        required this.hour,
    });

    factory WeekprogramModel.fromJson(Map<String, dynamic> json) => WeekprogramModel(
        material: Material.fromJson(json["material"]),
        day: json["day"],
        hour: json["hour"],
    );

    Map<String, dynamic> toJson() => {
        "material": material.toJson(),
        "day": day,
        "hour": hour,
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
