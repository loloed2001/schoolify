import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/chart_model.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/notes_model.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/ranking_model.dart';
import 'package:myshop/core/shared/toaster.dart';
import 'package:myshop/core/unified_api/get_api.dart';

import '../../../../../core/shared/request_status.dart';
import '../../../../../core/shared/shared_preferences_service.dart';
import '../models/dawam_model.dart';
import '../models/exams_model.dart';
import '../models/marks_model.dart';
import '../models/user_models.dart';
import '../models/weekly_program_model.dart';
import '../repo/user_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  List<WeeklyProgram> program = [];
  List<UserExamsModel> exams = [];
  List<MarksResponseModel> marks = [];
  UsersBloc() : super(UsersState()) {
    on<GetUserProgramEvent>((event, emit) async {
      emit(state.copyWith(weeklyProgramStatus: RequestStatus.loading));
      final result = await UserRepo().getWeeklyProgram(event.id);
      result.fold((l) {
        emit(state.copyWith(weeklyProgramStatus: RequestStatus.failed));
      }, (r) {
        program = r;
        emit(
          state.copyWith(
              weeklyProgramStatus: RequestStatus.success, program: r),
        );
      });
    });
    on<GetMarksEvent>((event, emit) async {
      emit(state.copyWith(marksStatus: RequestStatus.loading));
      final result = await UserRepo().indexMarks(event.id);
      result.fold((l) {
        emit(state.copyWith(marksStatus: RequestStatus.failed));
      }, (r) {
        marks = r;

        emit(
          state.copyWith(marks: marks, marksStatus: RequestStatus.success),
        );
      });
    });
    on<FilterProgramEvent>((event, emit) async {
      emit(state.copyWith(
          program: List.of(program).where((e) {
        return e.day == event.id;
      }).toList()));
    });
    on<FilterExamEvent>((event, emit) async {
      emit(state.copyWith(
          exams: List.of(exams).where((e) {
        return e.date?.day == event.id && e.date?.month == event.month;
      }).toList()));
    });
    on<GetExamsEvent>((event, emit) async {
      emit(state.copyWith(examsStatus: RequestStatus.loading));
      final result = await UserRepo().indexExams(event.id);
      result.fold((l) {
        emit(state.copyWith(examsStatus: RequestStatus.failed));
      }, (r) {
        exams = r;
        emit(state.copyWith(examsStatus: RequestStatus.success, exams: exams));
      });
    });
    on<GetDawamEvent>((event, emit) async {
      emit(state.copyWith(dawamStatus: RequestStatus.loading));
      final result = await UserRepo().indexDawam(event.id);
      result.fold((l) {
        emit(state.copyWith(dawamStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(dawamStatus: RequestStatus.success, dawam: r));
      });
    });
    on<GetRanking>((event, emit) async {
      emit(state.copyWith(ranksStatus: RequestStatus.loading));
      final result = await UserRepo().getRank(event.id);
      result.fold((l) {
        emit(state.copyWith(ranksStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(ranksStatus: RequestStatus.success, ranks: r));
      });
    });
    on<GetCharts>((event, emit) async {
      emit(state.copyWith(chartsStatus: RequestStatus.loading));
      final result = await UserRepo().getChart(event.id);
      final result1 = await GetApi<List<GetStudentInfoResponseModel>>(
              uri: Uri(
                  scheme: 'http',
                  host: 'www.marahschool.somee.com',
                  path: '/api/Students/GetAllStudentById',
                  queryParameters: {'StudentId': event.id.toString()}),
              fromJson: getStudentInfoResponseModelFromJson)
          .callRequest();
      print(result1.length);
      result.fold((l) {
        emit(state.copyWith(chartsStatus: RequestStatus.failed));
      }, (r) {
        if (result1.isNotEmpty) {
          emit(state.copyWith(
              chartsStatus: RequestStatus.success,
              charts: r,
              userInfo: result1.firstOrNull));
        } else
          emit(state.copyWith(chartsStatus: RequestStatus.success, charts: r));
      });
    });
    on<EditPassword>((event, emit) async {
      Toaster.closeLoading();
      final result = await UserRepo().editPassword({
        'id': event.id,
        'password': event.password,
        'newPassword': event.newPassword
      });
      result.fold((left) {
        Toaster.showToast(left.message);
      }, (right) {});
      Toaster.closeLoading();
    });
    on<GetNotes>((event, emit) async {
      emit(state.copyWith(notesStatus: RequestStatus.loading));
      final result = await UserRepo().getNotes(event.id);
      result.fold((l) {
        emit(state.copyWith(notesStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(notesStatus: RequestStatus.success, notes: r));
      });
    });
    on<GetAllChilds>((event, emit) async {
      final result = await UserRepo().getChilds(event.id);
      result.fold((l) {}, (r) {
        SharedPreferencesService.storeChilds(userModelToJson(r));
      });
    });
  }
}
