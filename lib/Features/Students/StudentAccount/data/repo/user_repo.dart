import 'package:dartz/dartz.dart';
import 'package:myshop/Features/Students/StudentAccount/data/datasource/user_datasource.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/weekly_program_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/unified_api/handling_exception_manager.dart';

class UserRepo with HandlingExceptionManager {
  Future<Either<Failure, List<WeeklyProgram>>> getWeeklyProgram(int id) async {
    return wrapHandling(tryCall: () async {
      return await UserDatasource().getWeeklyProgram(id);
    });
  }
}
