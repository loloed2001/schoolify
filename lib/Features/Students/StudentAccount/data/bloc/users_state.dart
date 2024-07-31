part of 'users_bloc.dart';

class UsersState {
  final RequestStatus weeklyProgramStatus;
  final List<WeeklyProgram> program;
  final RequestStatus examsStatus;
  final List<UserExamsModel> exams;
  final RequestStatus dawamStatus;
  final List<UserDawamModel> dawam;
  final RequestStatus marksStatus;
  final List<MarksResponseModel> marks;
  UsersState({
    this.weeklyProgramStatus = RequestStatus.init,
    this.program = const [],
    this.examsStatus = RequestStatus.init,
    this.exams = const [],
    this.marksStatus = RequestStatus.init,
    this.marks = const [],
    this.dawamStatus = RequestStatus.init,
    this.dawam = const [],
  });

  UsersState copyWith({
    RequestStatus? weeklyProgramStatus,
    List<WeeklyProgram>? program,
    RequestStatus? examsStatus,
    List<UserExamsModel>? exams,
    RequestStatus? dawamStatus,
    List<UserDawamModel>? dawam,
    RequestStatus? marksStatus,
    List<MarksResponseModel>? marks,
  }) {
    return UsersState(
      weeklyProgramStatus: weeklyProgramStatus ?? this.weeklyProgramStatus,
      program: program ?? this.program,
      examsStatus: examsStatus ?? this.examsStatus,
      exams: exams ?? this.exams,
      dawamStatus: dawamStatus ?? this.dawamStatus,
      dawam: dawam ?? this.dawam,
      marksStatus: marksStatus ?? this.marksStatus,
      marks: marks ?? this.marks,
    );
  }
}
