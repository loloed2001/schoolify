import 'package:dartz/dartz.dart';
import '../datasource/user_datasource.dart';
import '../models/dawam_model.dart';
import '../models/weekly_program_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/unified_api/handling_exception_manager.dart';
import '../models/exams_model.dart';
import '../models/marks_model.dart';
import '../models/user_models.dart';

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
}
