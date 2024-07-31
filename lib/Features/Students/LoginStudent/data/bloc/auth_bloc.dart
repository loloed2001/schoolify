import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/shared/shared_preferences_service.dart';
import '../../../StudentAccount/data/models/user_models.dart';
import '../models/auth_datasource.dart';
import '../models/auth_models.dart';

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
      final isParents = (SharedPreferencesService.getType() ?? '') == 'Parents';
      {
        final isAuth = SharedPreferencesService.getUser();

        if (isAuth == null) {
          emit(AuthInitial());
        } else {
          if (isParents) {
            final childs = userModelFromJson(
                (SharedPreferencesService.getChilds() ?? '[]'));
            emit(
              Authsucss(
                  auth: Authmodel.fromJson(
                    jsonDecode(isAuth),
                  ),
                  childs: childs),
            );
          } else {
            emit(Authsucss(auth: Authmodel.fromJson(jsonDecode(isAuth))));
          }
        }
      }
    });
  }
}
