part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class GetUserProgramEvent extends UsersEvent {
  final int id;
  GetUserProgramEvent({
    required this.id,
  });
}
