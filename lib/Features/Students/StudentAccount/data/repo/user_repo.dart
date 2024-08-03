import 'package:dartz/dartz.dart';
import 'package:myshop/core/shared/type_defs.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/unified_api/handling_exception_manager.dart';
import '../datasource/user_datasource.dart';
import '../models/chart_model.dart';
import '../models/dawam_model.dart';
import '../models/exams_model.dart';
import '../models/marks_model.dart';
import '../models/notes_model.dart';
import '../models/ranking_model.dart';
import '../models/user_models.dart';
import '../models/weekly_program_model.dart';

class UserRepo with HandlingExceptionManager {
  Future<Either<Failure, List<WeeklyProgram>>> getWeeklyProgram(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getWeeklyProgram(id);
    });
  }

  Future<Either<Failure, List<UserModel>>> getChilds(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getUserList(id);
    });
  }

  Future<Either<Failure, List<UserExamsModel>>> indexExams(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getExams(id);
    });
  }

  Future<Either<Failure, List<UserDawamModel>>> indexDawam(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getDawam(id);
    });
  }

  Future<Either<Failure, List<MarksResponseModel>>> indexMarks(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getMarks(id);
    });
  }

  Future<Either<Failure, List<GetUserRanking>>> getRank(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getRank(id);
    });
  }

  Future<Either<Failure, void>> editPassword(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().editPassword(body);
    });
  }

  Future<Either<Failure, List<GetNotesModel>>> getNotes(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getNotes(id);
    });
  }

  Future<Either<Failure, GetChartsModel>> getChart(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getCharts(id);
    });
  }
}
