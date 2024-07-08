import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:myshop/Features/Students/StudentAccount/data/models/user_models.dart';

class getStudentbyId {
  Future<List<UserModel>> getUserList({int? StudentId}) async {
    http.Response response = await http.get(Uri.parse(
        "http://www.marahschool.somee.com/api/Students/GetAllStudentById?StudentId=20"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<UserModel> userlist = [];
      for (var item in jsonData) {
        userlist.add(UserModel.fromJson(item));
      }

      return userlist;
    } else {
      throw Exception('problem with status code${response.statusCode}');
    }
  }
}
