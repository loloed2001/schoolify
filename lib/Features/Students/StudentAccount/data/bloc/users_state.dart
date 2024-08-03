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
  final RequestStatus ranksStatus;
  final List<GetUserRanking> ranks;
  final RequestStatus chartsStatus;
  final List<GetNotesModel> notes;
  final RequestStatus notesStatus;
  final GetChartsModel? charts;
  final RequestStatus passwordStatus;

  UsersState({
    this.passwordStatus = RequestStatus.init,
    this.weeklyProgramStatus = RequestStatus.init,
    this.program = const [],
    this.examsStatus = RequestStatus.init,
    this.exams = const [],
    this.notes = const [],
    this.dawamStatus = RequestStatus.init,
    this.notesStatus = RequestStatus.init,
    this.dawam = const [],
    this.marksStatus = RequestStatus.init,
    this.marks = const [],
    this.ranksStatus = RequestStatus.init,
    this.ranks = const [],
    this.chartsStatus = RequestStatus.init,
    this.charts,
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
    RequestStatus? ranksStatus,
    List<GetUserRanking>? ranks,
    RequestStatus? chartsStatus,
    List<GetNotesModel>? notes,
    RequestStatus? notesStatus,
    GetChartsModel? charts,
    RequestStatus? passwordStatus,
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
      ranksStatus: ranksStatus ?? this.ranksStatus,
      ranks: ranks ?? this.ranks,
      chartsStatus: chartsStatus ?? this.chartsStatus,
      notes: notes ?? this.notes,
      notesStatus: notesStatus ?? this.notesStatus,
      charts: charts ?? this.charts,
      passwordStatus: passwordStatus ?? this.passwordStatus,
    );
  }
}
