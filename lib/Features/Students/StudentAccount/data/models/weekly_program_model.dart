// To parse this JSON data, do
//
//     final indexAdvertsModel = indexAdvertsModelFromJson(jsonString);

import 'dart:convert';

List<WeeklyProgram> indexWeeklyModelFromJson(String str) =>
    List<WeeklyProgram>.from(
        json.decode(str).map((x) => WeeklyProgram.fromJson(x)));

String indexAdvertsModelToJson(List<WeeklyProgram> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeeklyProgram {
  final Material? material;
  final int? day;
  final String? hour;

  WeeklyProgram({
    this.material,
    this.day,
    this.hour,
  });

  factory WeeklyProgram.fromJson(Map<String, dynamic> json) => WeeklyProgram(
        material: json["material"] == null
            ? null
            : Material.fromJson(json["material"]),
        day: json["day"],
        hour: json["hour"],
      );

  Map<String, dynamic> toJson() => {
        "material": material?.toJson(),
        "day": day,
        "hour": hour,
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
