import 'dart:convert';

import 'package:myshop/helper/api.dart';
import 'package:myshop/models/weekprogram_model.dart';
import 'package:http/http.dart' as http;
class WeekprgService{


  Future<List<WeekprogramModel>> getWeekprg({required int sectionid })async{
   http.Response response = 
        await Api().get(url: 'http://www.marahschool.somee.com/api/WeeklyProggram/GetBySection?sectionId=$sectionid');
  
   
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