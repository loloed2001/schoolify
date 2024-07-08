import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/user_datasource.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/user_models.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersEvent>((event, emit) async {
      emit(UsersLoading());

      final result = await getStudentbyId().getUserList();
      if (result != null) {
        emit(UsersSuccess(usesr: result));
      } else {
        emit(UsersFaliure());
      }
    });
  }
}
