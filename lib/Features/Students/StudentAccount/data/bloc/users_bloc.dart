import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:myshop/Features/Students/StudentAccount/data/repo/user_repo.dart';

import '../../../../../core/shared/request_status.dart';
import '../models/weekly_program_model.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersState()) {
    on<GetUserProgramEvent>((event, emit) async {
      emit(state.copyWith(weeklyProgramStatus: RequestStatus.loading));
      final result = await UserRepo().getWeeklyProgram(event.id);
      result.fold((l) {
        emit(state.copyWith(weeklyProgramStatus: RequestStatus.failed));
      }, (r) {
        emit(
          state.copyWith(
              weeklyProgramStatus: RequestStatus.success, program: r),
        );
      });
    });
  }
}
