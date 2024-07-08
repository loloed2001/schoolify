import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myshop/Features/Students/LoginStudent/data/models/auth_datasource.dart';
import 'package:myshop/Features/Students/LoginStudent/data/models/auth_models.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<loginEvent>((event, emit) async {
      emit(Authloading());
      final result = await AuthDataSource().login(event.email, event.password);
      print(result);
      if (result != null) {
        emit(Authsucss(auth: result));
      } else {
        emit(Authfaliuer());
      }
    });
  }
}
