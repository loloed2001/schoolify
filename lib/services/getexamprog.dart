import 'dart:convert';

import 'package:http/http.dart'as http;

import 'package:myshop/helper/api.dart';
import 'package:myshop/models/Examprogram_model.dart';

class getExamprogram{


Future<List<ExamprogramModel>> getexamprog ({required int sectionid })async{
    http.Response response = 
        await Api().get(url: 'http://www.marahschool.somee.com/api/Exam/GetAllBySection?sectionId=$sectionid');
  
   
    
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body); // فك تشفير نص الاستجابة JSON
    List<ExamprogramModel> examlist = [];
    for (var item in jsonData) {
      examlist.add(ExamprogramModel.fromJson(item));
    }
    return examlist;
  } else {
    throw Exception('There is a problem: ${response.statusCode}');
  }
}
}