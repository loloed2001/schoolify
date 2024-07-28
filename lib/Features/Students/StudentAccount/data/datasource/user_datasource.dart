import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myshop/Features/Students/StudentAccount/data/models/exams_model.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/user_models.dart';
import 'package:myshop/core/unified_api/api_variables.dart';
import 'package:myshop/core/unified_api/get_api.dart';

import '../models/weekly_program_model.dart';

class UserDatasource {
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

  Future<List<WeeklyProgram>> getWeeklyProgram(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getWeeklyProgram(id),
        fromJson: indexWeeklyModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<UserExamsModel>> getExams(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getExams(id), fromJson: userExamsModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<UserExamsModel>> getDawam(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getDawam(id), fromJson: userExamsModelFromJson);
    return await getApi.callRequest();
  }
}
