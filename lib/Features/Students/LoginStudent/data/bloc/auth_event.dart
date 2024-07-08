part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class loginEvent extends AuthEvent {
  final String email, password;

  loginEvent({required this.email, required this.password});
}
