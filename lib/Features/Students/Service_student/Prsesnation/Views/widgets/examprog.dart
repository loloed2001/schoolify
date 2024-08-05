import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:intl/intl.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/shared/request_status.dart';
import '../../../../../../core/shared/shared_preferences_service.dart';
import '../../../../../../core/widgets/main_error_widget.dart';
import '../../../../LoginStudent/data/bloc/auth_bloc.dart';
import '../../../../StudentAccount/data/bloc/users_bloc.dart';

class Examprog extends StatefulWidget {
  const Examprog({super.key});

  @override
  State<Examprog> createState() => _ExamprogState();
}

class _ExamprogState extends State<Examprog> {
  DateTime? selectedDate = DateTime.now();
  late ValueNotifier<int?> selectedChild;
  @override
  void initState() {
    super.initState();
    if (SharedPreferencesService.getType() == 'Parents') {
      selectedChild = ValueNotifier(
          (context.read<AuthBloc>().state as Authsucss)
                  .childs
                  .firstOrNull
                  ?.id ??
              1);
      context.read<UsersBloc>().add(
            GetExamsEvent(
              id: (context.read<AuthBloc>().state as Authsucss)
                      .childs
                      .firstOrNull
                      ?.id ??
                  1,
            ),
          );
    } else {
      context.read<UsersBloc>().add(
            GetExamsEvent(
              id: (context.read<AuthBloc>().state as Authsucss).auth!.id!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listenWhen: (previous, current) {
        return previous.exams.length != current.exams.length;
      },
      listener: (c, s) {
        if (s.examsStatus == RequestStatus.success) {
          context.read<UsersBloc>().add(FilterExamEvent(
              id: selectedDate!.day, month: selectedDate!.month));
        }
      },
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
                AppLocalizations.of(context)!.exampro,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: state.examsStatus == RequestStatus.success
                ? Column(children: [
                    if (SharedPreferencesService.getType() == 'Parents')
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                AppLocalizations.of(context)!.chosestd,
                                style:
                                    TextStyle(fontFamily: KFont3, fontSize: 20),
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
                                            .add(GetExamsEvent(id: item));
                                      });
                                }),
                            
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat.yMMMd().format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: KPrimeryColor1),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: DatePicker(
                          DateTime.now(),
                          height: 120,
                          width: 80,
                          initialSelectedDate: DateTime.now(),
                          daysCount: 30,
                          selectionColor: KPrimeryColor1,
                          onDateChange: (_selectedDate) {
                            selectedDate = _selectedDate;
                            context.read<UsersBloc>().add(FilterExamEvent(
                                id: _selectedDate.day,
                                month: _selectedDate.microsecond));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: state.exams.isEmpty
                          ? Center(
                              child: Text('No Exams For Selected Day'),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 2,
                                      mainAxisSpacing: 20),
                              itemCount: state.exams.length,
                              itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 6.5,
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: Offset(8, 3))
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: KPrimeryColor1, width: 2),
                                    color: KPrimeryColor2,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * .9,
                                  width:
                                      MediaQuery.of(context).size.width * .95,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: AppLocalizations.of(context)!.subject,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                     
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: KPrimeryColor1),
                                                ),
                                                TextSpan(
                                                  text: "   ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "${state.exams[index].name}",
                                                  style: TextStyle(
                                                     
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 59, 59, 59),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: AppLocalizations.of(context)!.hour,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: KPrimeryColor1),
                                                ),
                                                TextSpan(
                                                  text: "   ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "${state.exams[index].date?.hour}",
                                                  style: TextStyle(
                                                     
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 59, 59, 59),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: AppLocalizations.of(context)!.classs,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: KPrimeryColor1),
                                                ),
                                                TextSpan(
                                                  text: "   ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text: state
                                                      .exams[index]
                                                      .userExamsModelClass
                                                      ?.name,
                                                  style: TextStyle(
                                                      
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 59, 59, 59),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: AppLocalizations.of(context)!.type,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: KPrimeryColor1),
                                                ),
                                                TextSpan(
                                                  text: "   ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${state.exams[index].type}',
                                                  style: TextStyle(
                                                      
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 59, 59, 59),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ])),
                            ),
                    ),
                  ])
                : state.examsStatus == RequestStatus.failed
                    ? Center(
                        child: MainErrorWidget(onPressed: () {
                          context
                              .read<UsersBloc>()
                              .add(GetExamsEvent(id: selectedChild.value!));
                        }),
                      )
                    : Center(
                        child: CircularProgressIndicator.adaptive(),
                      ));
      },
    );
  }
}
