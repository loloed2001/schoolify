part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersSuccess extends UsersState {
  final List<UserModel> usesr;
  UsersSuccess({this.usesr = const []});
}

final class UsersFaliure extends UsersState {}
