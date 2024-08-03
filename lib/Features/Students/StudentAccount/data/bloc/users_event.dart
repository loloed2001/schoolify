part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class GetUserProgramEvent extends UsersEvent {
  final int id;
  GetUserProgramEvent({
    required this.id,
  });
}

class FilterProgramEvent extends UsersEvent {
  final int id;
  FilterProgramEvent({
    required this.id,
  });
}

class FilterExamEvent extends UsersEvent {
  final int id;
  final int month;

  FilterExamEvent({
    required this.id,
    required this.month,
  });
}

class GetExamsEvent extends UsersEvent {
  final int id;
  GetExamsEvent({
    required this.id,
  });
}

class GetMarksEvent extends UsersEvent {
  final int id;
  GetMarksEvent({
    required this.id,
  });
}

class GetDawamEvent extends UsersEvent {
  final int id;
  GetDawamEvent({
    required this.id,
  });
}

class GetAllChilds extends UsersEvent {
  final int id;
  GetAllChilds({
    required this.id,
  });
}

class GetCharts extends UsersEvent {
  final int id;
  GetCharts({
    required this.id,
  });
}

class GetRanking extends UsersEvent {
  final int id;
  GetRanking({
    required this.id,
  });
}

class GetNotes extends UsersEvent {
  final int id;
  GetNotes({
    required this.id,
  });
}

class EditPassword extends UsersEvent {
  final int id;

  final String password;
  final String newPassword;
  EditPassword({
    required this.id,
    required this.password,
    required this.newPassword,
  });
}
