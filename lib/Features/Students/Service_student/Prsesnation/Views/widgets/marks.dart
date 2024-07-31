import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:myshop/Features/Students/StudentAccount/data/bloc/users_bloc.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/marks_model.dart';
import 'package:myshop/core/shared/request_status.dart';
import 'package:myshop/core/widgets/main_error_widget.dart';

import '../../../../../../constant.dart';

class MarksScreen extends StatefulWidget {
  const MarksScreen({super.key});

  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {
  @override
  void didChangeDependencies() {
    context.read<UsersBloc>().add(GetMarksEvent(id: 18));

    super.didChangeDependencies();
  }

  final List<StudentMark> _marks = [
    StudentMark(
      date: DateTime.now(),
      subject: 'الرياضيات',
      grade: 85,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'العلوم',
      grade: 90,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'اللغة العربية',
      grade: 85,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'اللغة الانكليزية',
      grade: 85,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'اللغة الفرنسية',
      grade: 85,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'الديانة',
      grade: 85,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'المعلوماتية',
      grade: 20,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'التربية الفنية',
      grade: 85,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'التربية الموسيقية',
      grade: 10,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'الرياضة',
      grade: 85,
    ),
    StudentMark(
      date: DateTime.now(),
      subject: 'الاجتماعيات',
      grade: 85,
    ),
  ];
  Color _buildColor(int grade) {
    if (grade >= 30) {
      return (Colors.green); // أخضر للعلامات 30 وما فوق
    } else {
      return Colors.red; // أحمر للعلامات أقل من 30
    }
  }

  Color _buildColor1(double total) {
    if (total >= 30) {
      return (Colors.green); // أخضر للمجموع 30 وما فوق
    } else {
      return Colors.red; // أحمر للمجموع أقل من 30
    }
  }

  double get totalMarks =>
      _marks.fold(0.0, (sum, mark) => sum + mark.grade) / 10;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: GradientAppBar(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                //KPrimeryColor2,
                Color(0xFFCD6FD0),
                Color(0xFF9B71D2),
                Color(0xFF9B71D2),
                // Color(0xFF703EA9),
                Color(0xFFCD6FD0),
              ],
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            title: Text(
              AppLocalizations.of(context)!.mark,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: state.marksStatus == RequestStatus.success
              ? SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    color: KPrimeryColor2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: " اسم الطالب " ":",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: KFont,
                                      fontWeight: FontWeight.bold,
                                      color: KPrimeryColor1),
                                ),
                                TextSpan(
                                  text: "   ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                TextSpan(
                                  text: (state.marks.first.student?.firstName ??
                                          '') +
                                      '  ' +
                                      (state.marks.first.student?.lastName ??
                                          ''),
                                  style: TextStyle(
                                      fontFamily: KFont,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 59, 59, 59),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: " السنة الدراسية  " ":",
                                  style: TextStyle(
                                      fontFamily: KFont,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: KPrimeryColor1),
                                ),
                                TextSpan(
                                  text: "   ",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: state
                                      .marks.first.student?.studentClass?.name,
                                  style: TextStyle(
                                      fontFamily: KFont,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 59, 59, 59),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (state.marks.first.student?.section?.name != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: " الشعبة" ":",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: KFont,
                                        fontWeight: FontWeight.bold,
                                        color: KPrimeryColor1),
                                  ),
                                  TextSpan(
                                    text: "   ",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: state.marks.first.student?.section
                                            ?.name ??
                                        '',
                                    style: TextStyle(
                                        fontFamily: KFont,
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 59, 59, 59),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        DataTable(
                          columns: const [
                            DataColumn(
                                label: Text(
                              'التاريخ',
                              style: TextStyle(
                                  fontFamily: KFont,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: KPrimeryColor1),
                            )),
                            DataColumn(
                                label: Text('الدرجة',
                                    style: TextStyle(
                                        fontFamily: KFont,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: KPrimeryColor1))),
                            DataColumn(
                                label: Text('المادة',
                                    style: TextStyle(
                                        fontFamily: KFont,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: KPrimeryColor1))),
                          ],
                          rows: state.marks.map((mark) {
                            final formattedDate = DateFormat('y-MM-dd')
                                .format(mark.date ?? DateTime.now());
                            return DataRow(cells: [
                              DataCell(Text(
                                formattedDate,
                                style:
                                    TextStyle(fontFamily: KFont, fontSize: 16),
                              )),
                              DataCell(
                                Text(
                                  mark.mark.toString(),
                                  style: TextStyle(
                                      fontFamily: KFont,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: _buildColor(mark.mark!)),
                                ),
                              ),
                              DataCell(Text(
                                mark.material!.name!,
                                style: TextStyle(
                                    fontFamily: KFont,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              )),
                            ]);
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "المعدل : ",
                                  style: TextStyle(
                                      fontFamily: KFont,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: KPrimeryColor1),
                                ),
                                TextSpan(
                                  text: "   ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                TextSpan(
                                  text: (state.marks.reduce((e, c) {
                                            return MarksResponseModel(
                                                mark: e.mark! + c.mark!);
                                          }).mark! /
                                          state.marks.length)
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: KFont,
                                      fontSize: 20,
                                      color: _buildColor1(totalMarks)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: state.marksStatus == RequestStatus.failed
                      ? MainErrorWidget(onPressed: () {
                          context.read<UsersBloc>().add(GetMarksEvent(id: 18));
                        })
                      : CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}

class StudentMark {
  final DateTime date;
  final int grade;

  final String subject;

  StudentMark({
    required this.date,
    required this.grade,
    required this.subject,
  });
}
