import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/api.dart';
import '../models/weekprogram_model.dart';

class WeekprgService {
  Future<List<WeekprogramModel>> getWeekprg({required int sectionid}) async {
    http.Response response = await Api().get(
        url:
            'http://www.marahschool.somee.com/api/WeeklyProggram/GetBySection?sectionId=$sectionid');

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body); // فك تشفير نص الاستجابة JSON
      List<WeekprogramModel> weeklist = [];
      for (var item in jsonData) {
        weeklist.add(WeekprogramModel.fromJson(item));
      }
      return weeklist;
    } else {
      throw Exception('There is a problem: ${response.statusCode}');
    }
  }
}
