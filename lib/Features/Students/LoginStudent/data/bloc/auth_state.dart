part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Authsucss extends AuthState {
  final Authmodel? auth;
  Authsucss({this.auth});
}

final class Authloading extends AuthState {}

final class Authfaliuer extends AuthState {}