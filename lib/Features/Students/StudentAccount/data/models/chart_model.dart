// To parse this JSON data, do
//
//     final getChartsModel = getChartsModelFromJson(jsonString);

import 'dart:convert';

GetChartsModel getChartsModelFromJson(String str) =>
    GetChartsModel.fromJson(json.decode(str));

String getChartsModelToJson(GetChartsModel data) => json.encode(data.toJson());

class GetChartsModel {
  final double? markAverage;
  final int? isPresentPercentage;

  GetChartsModel({
    this.markAverage,
    this.isPresentPercentage,
  });

  factory GetChartsModel.fromJson(Map<String, dynamic> json) => GetChartsModel(
        markAverage: json["markAverage"]?.toDouble(),
        isPresentPercentage: json["isPresentPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "markAverage": markAverage,
        "isPresentPercentage": isPresentPercentage,
      };
}
