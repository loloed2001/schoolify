import 'dart:developer';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  final _scheme = 'http';
  final _host = "www.marahschool.somee.com";

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      // port: 7000,
      path: 'api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString(), name: 'uri');
    return uri;
  }

  Uri getClasses() => _mainUri(path: 'Classes/GetAll');
  Uri getPosts() => _mainUri(path: 'Posts/GetAllPosts');
  Uri getAdverts() => _mainUri(path: 'Posts/GetAllAdvert');
  Uri getUsers(int id) => _mainUri(
      path: 'Students/GetAllStudentsByParentId',
      queryParameters: {'parentId': '$id'});
  Uri getWeeklyProgram(int id) => _mainUri(
      path: 'WeeklyProggram/GetByStudent',
      queryParameters: {'studentId': '$id'});
  Uri getMarks(int id) => _mainUri(
      path: 'Marks/GetAllMarksByStudentId',
      queryParameters: {'studentId': '$id'});
  Uri getExams(int id) => _mainUri(
      path: 'Exam/GetAllByStudent', queryParameters: {'studentId': '$id'});
  Uri getDawam(int id) => _mainUri(
      path: 'WeeklyProggram/GetStudentDawam',
      queryParameters: {'studentId': '$id'});
}
