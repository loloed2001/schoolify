import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myshop/Features/Students/LoginStudent/data/models/auth_datasource.dart';
import 'package:myshop/Features/Students/LoginStudent/data/models/auth_models.dart';
import 'package:myshop/core/shared/shared_preferences_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<loginEvent>((event, emit) async {
      emit(Authloading());
      final result = await AuthDataSource().login(event.email, event.password);
      print(result);
      if (result != null) {
        SharedPreferencesService.storeUser(jsonEncode(result.toJson()));
        emit(Authsucss(auth: result));
      } else {
        emit(Authfaliuer());
      }
    });
    on<CheckAuthEvent>((event, emit) async {
      final isAuth = SharedPreferencesService.getUser();
      if (isAuth == null) {
        emit(AuthInitial());
      } else {
        print(jsonDecode(isAuth));
        emit(Authsucss(auth: Authmodel.fromJson(jsonDecode(isAuth))));
      }
    });
  }
}
