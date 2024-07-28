part of 'users_bloc.dart';

class UsersState {
  final RequestStatus weeklyProgramStatus;
  final List<WeeklyProgram> program;
  UsersState({
    this.weeklyProgramStatus = RequestStatus.init,
    this.program = const [],
  });

  UsersState copyWith({
    RequestStatus? weeklyProgramStatus,
    List<WeeklyProgram>? program,
  }) {
    return UsersState(
      weeklyProgramStatus: weeklyProgramStatus ?? this.weeklyProgramStatus,
      program: program ?? this.program,
    );
  }
}
