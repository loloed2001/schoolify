import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:myshop/core/extensions/context_extensions.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/shared/request_status.dart';
import '../../../../../../core/shared/shared_preferences_service.dart';
import '../../../../../../core/widgets/main_error_widget.dart';
import '../../../../LoginStudent/data/bloc/auth_bloc.dart';
import '../../../../StudentAccount/data/bloc/users_bloc.dart';
import '../../../../StudentAccount/data/models/marks_model.dart';

class MarksScreen extends StatefulWidget {
  const MarksScreen({super.key});

  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {
  late ValueNotifier<int?> selectedChild;

  @override
  void didChangeDependencies() {
    if (SharedPreferencesService.getType() == 'Parents') {
      selectedChild = ValueNotifier(
          (context.read<AuthBloc>().state as Authsucss)
                  .childs
                  .firstOrNull
                  ?.id ??
              1);
      context.read<UsersBloc>().add(
            GetMarksEvent(
              id: (context.read<AuthBloc>().state as Authsucss)
                      .childs
                      .firstOrNull
                      ?.id ??
                  1,
            ),
          );
    } else {
      context.read<UsersBloc>().add(
            GetMarksEvent(
              id: (context.read<AuthBloc>().state as Authsucss).auth!.id!,
            ),
          );
    }

    super.didChangeDependencies();
  }

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
                        if (SharedPreferencesService.getType() == 'Parents')
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    AppLocalizations.of(context)!.chosestd,
                                    style: TextStyle(
                                        fontFamily: KFont3, fontSize: 20),
                                  ),
                                ),
                                ValueListenableBuilder(
                                    valueListenable: selectedChild,
                                    builder: (context, value, _) {
                                      return DropdownButton<int>(
                                          dropdownColor: KPrimeryColor2,
                                          style: TextStyle(
                                              color: KPrimeryColor1,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          alignment: Alignment.centerRight,
                                          value: value,
                                          items: (context.read<AuthBloc>().state
                                                  as Authsucss)
                                              .childs
                                              .map((k) {
                                            return DropdownMenuItem(
                                              child: Text(k.firstName!),
                                              value: k.id!,
                                            );
                                          }).toList(),
                                          onChanged: (item) {
                                            selectedChild.value = item!;
                                            context
                                                .read<UsersBloc>()
                                                .add(GetMarksEvent(id: item));
                                          });
                                    }),
                              ],
                            ),
                          ),
                        SizedBox(
                          height:
                              state.marks.isEmpty ? context.height() * .3 : 0,
                        ),
                        state.marks.isEmpty
                            ? Center(child: Text('There Is No Data'))
                            : Padding(
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
                                        text: (state.marks.firstOrNull?.student
                                                    ?.firstName ??
                                                '') +
                                            '  ' +
                                            (state.marks.firstOrNull?.student
                                                    ?.lastName ??
                                                ''),
                                        style: TextStyle(
                                            fontFamily: KFont,
                                            fontSize: 17,
                                            color:
                                                Color.fromARGB(255, 59, 59, 59),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        state.marks.isEmpty
                            ? SizedBox()
                            : Padding(
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
                                        text: state.marks.firstOrNull?.student
                                            ?.studentClass?.name,
                                        style: TextStyle(
                                            fontFamily: KFont,
                                            fontSize: 17,
                                            color:
                                                Color.fromARGB(255, 59, 59, 59),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        if (state.marks.firstOrNull?.student?.section?.name !=
                            null)
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
                                    text: state.marks.firstOrNull?.student
                                            ?.section?.name ??
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
                        state.marks.isEmpty
                            ? SizedBox()
                            : DataTable(
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
                                      style: TextStyle(
                                          fontFamily: KFont, fontSize: 16),
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
                        state.marks.isEmpty
                            ? SizedBox()
                            : Padding(
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
                                        text: (state.marks.isNotEmpty
                                                ? state.marks.reduce((e, c) {
                                                      return MarksResponseModel(
                                                          mark: e.mark! +
                                                              c.mark!);
                                                    }).mark! /
                                                    state.marks.length
                                                : 10)
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: KFont,
                                            fontSize: 20,
                                            color: _buildColor1((state
                                                    .marks.isNotEmpty
                                                ? state.marks.reduce((e, c) {
                                                      return MarksResponseModel(
                                                          mark: e.mark! +
                                                              c.mark!);
                                                    }).mark! /
                                                    state.marks.length
                                                : 10))),
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
                          context
                              .read<UsersBloc>()
                              .add(GetMarksEvent(id: selectedChild.value!));
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
