import 'package:myshop/Features/Students/StudentAccount/data/models/notes_model.dart';
import 'package:myshop/core/shared/type_defs.dart';
import 'package:myshop/core/unified_api/patch_api.dart';

import '../../../../../core/unified_api/api_variables.dart';
import '../../../../../core/unified_api/get_api.dart';
import '../models/chart_model.dart';
import '../models/dawam_model.dart';
import '../models/exams_model.dart';
import '../models/marks_model.dart';
import '../models/ranking_model.dart';
import '../models/user_models.dart';
import '../models/weekly_program_model.dart';

class UserDatasource {
  Future<List<UserModel>> getUserList(int id) async {
    final getApi =
        GetApi(uri: ApiVariables().getUsers(id), fromJson: userModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<WeeklyProgram>> getWeeklyProgram(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getWeeklyProgram(id),
        fromJson: indexWeeklyModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<GetUserRanking>> getRank(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getRank(id), fromJson: getUserRankingFromJson);
    return await getApi.callRequest();
  }

  Future<List<GetNotesModel>> getNotes(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getBehaviour(id), fromJson: getNotesModelFromJson);
    return await getApi.callRequest();
  }

  Future<void> editPassword(BodyMap body) async {
    final getApi = PatchApi(
        uri: ApiVariables().editPassword(),
        body: body,
        fromJson: (s){});
    return await getApi.callRequest();
  }

  Future<GetChartsModel> getCharts(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getCharts(id), fromJson: getChartsModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<MarksResponseModel>> getMarks(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getMarks(id), fromJson: marksResponseModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<UserExamsModel>> getExams(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getExams(id), fromJson: userExamsModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<UserDawamModel>> getDawam(int id) async {
    final getApi = GetApi(
        uri: ApiVariables().getDawam(id), fromJson: userDawamModelFromJson);
    return await getApi.callRequest();
  }
}
