import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/shared/request_status.dart';
import '../../../../../../core/shared/shared_preferences_service.dart';
import '../../../../../../core/widgets/main_error_widget.dart';
import '../../../../LoginStudent/data/bloc/auth_bloc.dart';
import '../../../../StudentAccount/data/bloc/users_bloc.dart';

class Inschool extends StatefulWidget {
  const Inschool({super.key});

  @override
  State<Inschool> createState() => _InschoolState();
}

class _InschoolState extends State<Inschool> {
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
            GetDawamEvent(
              id: (context.read<AuthBloc>().state as Authsucss)
                      .childs
                      .firstOrNull
                      ?.id ??
                  1,
            ),
          );
    } else {
      context.read<UsersBloc>().add(
            GetDawamEvent(
              id: (context.read<AuthBloc>().state as Authsucss).auth!.id!,
            ),
          );
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
                AppLocalizations.of(context)!.inschool,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: state.dawamStatus == RequestStatus.success
                ? Column(
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
                                              .add(GetExamsEvent(id: item));
                                        });
                                  }),
                              
                            ],
                          ),
                        ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .7,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 28.0, horizontal: 15),
                          child: Calendar(
                            weekDays: [
                              "الأحد",
                              "الاثنين",
                              "الثلاثاء",
                              "الأربعاء",
                              "الخميس",
                              "الجمعة",
                              'السبت'
                            ],
                            isExpanded: true,
                            eventsList: state.dawam.map(
                              (e) {
                                return NeatCleanCalendarEvent(
                                  e.note ?? '',
                                  description: e.student?.firstName ?? '',
                                  startTime: e.date!,
                                  endTime: e.date!,
                                  color: (e.isPresent ?? false)
                                      ? Color(0xFFCD6FD0)
                                      : Colors.cyan,
                                );
                              },
                            ).toList(),
                            initialDate: DateTime.now(),
                            eventListBuilder: (context, events) {
                              return Container(
                                  height: 200,
                                  child: ListView.builder(
                                      itemCount: events.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              gradient: LinearGradient(colors: [
                                                events[index]
                                                    .color!
                                                    .withOpacity(.05),
                                                events[index]
                                                    .color!
                                                    .withOpacity(.2)
                                              ])),
                                          margin: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                              leading: Container(
                                                width: 10,
                                                decoration: BoxDecoration(
                                                    color: events[index].color,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Column(),
                                              ),
                                              subtitle: Text(state.dawam
                                                      .where((e) {
                                                        return e.date?.day ==
                                                            events[index]
                                                                .startTime
                                                                .day;
                                                      })
                                                      .firstOrNull
                                                      ?.student
                                                      ?.firstName ??
                                                  ''),
                                              title:
                                                  Text(events[index].summary)),
                                        );
                                      }));
                            },
                            dayBuilder: (context, day) {
                              return Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: (state.dawam.where((e) {
                                              return e.date?.day == day.day &&
                                                  e.date?.month == day.month &&
                                                  e.date?.year == day.year;
                                            }).firstOrNull !=
                                            null)
                                        ? (state.dawam
                                                    .where((e) {
                                                      return e.date?.day ==
                                                          day.day;
                                                    })
                                                    .firstOrNull!
                                                    .isPresent ??
                                                false)
                                            ? Color(0xFFCD6FD0)
                                            : Colors.cyan
                                        : null,
                                  ),
                                  child: Text(day.day.toString()));
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: state.dawamStatus == RequestStatus.failed
                        ? MainErrorWidget(onPressed: () {
                            context
                                .read<UsersBloc>()
                                .add(GetDawamEvent(id: selectedChild.value!));
                          })
                        : CircularProgressIndicator.adaptive(),
                  ));
      },
    );
  }
}
