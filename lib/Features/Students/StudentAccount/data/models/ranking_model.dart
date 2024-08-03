// To parse this JSON data, do
//
//     final getUserRanking = getUserRankingFromJson(jsonString);

import 'dart:convert';

List<GetUserRanking> getUserRankingFromJson(String str) =>
    List<GetUserRanking>.from(
        json.decode(str).map((x) => GetUserRanking.fromJson(x)));

String getUserRankingToJson(List<GetUserRanking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUserRanking {
  final int? id;
  final String? fullName;
  final int? average;

  GetUserRanking({
    this.id,
    this.fullName,
    this.average,
  });

  factory GetUserRanking.fromJson(Map<String, dynamic> json) => GetUserRanking(
        id: json["id"],
        fullName: json["fullName"],
        average: json["average"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "average": average,
      };
}
