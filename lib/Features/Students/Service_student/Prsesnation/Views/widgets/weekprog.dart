import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/shared/request_status.dart';
import '../../../../../../core/shared/shared_preferences_service.dart';
import '../../../../../../core/widgets/main_error_widget.dart';
import '../../../../LoginStudent/data/bloc/auth_bloc.dart';
import '../../../../StudentAccount/data/bloc/users_bloc.dart';

class Weekprog extends StatefulWidget {
  const Weekprog({super.key});

  @override
  State<Weekprog> createState() => _WeekprogState();
}

class _WeekprogState extends State<Weekprog> {
  Map<int, String> dayMap = {
    0: "الأحد",
    1: "الاثنين",
    2: "الثلاثاء",
    3: "الاربعاء",
    4: "الخميس",
  };

  ValueNotifier<int> selectedDay = ValueNotifier(0);
  late ValueNotifier<int?> selectedChild;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (SharedPreferencesService.getType() == 'Parents') {
      selectedChild = ValueNotifier(
          (context.read<AuthBloc>().state as Authsucss)
                  .childs
                  .firstOrNull
                  ?.id ??
              1);
      context.read<UsersBloc>().add(
            GetUserProgramEvent(
              id: (context.read<AuthBloc>().state as Authsucss)
                      .childs
                      .firstOrNull
                      ?.id ??
                  1,
            ),
          );
    } else {
      context.read<UsersBloc>().add(
            GetUserProgramEvent(
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
                AppLocalizations.of(context)!.weekpro,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: state.weeklyProgramStatus == RequestStatus.failed
                ? Center(
                    child: MainErrorWidget(onPressed: () {
                      context
                          .read<UsersBloc>()
                          .add(GetUserProgramEvent(id: selectedChild.value!));
                    }),
                  )
                : state.weeklyProgramStatus == RequestStatus.success
                    ? ValueListenableBuilder(
                        valueListenable: selectedDay,
                        builder: (context, value, _) {
                          return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                height: 800,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          DropdownButton<int>(
                                              dropdownColor: KPrimeryColor2,
                                              style: TextStyle(
                                                  color: KPrimeryColor1,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                              alignment: Alignment.centerRight,
                                              value: value,
                                              items: dayMap.entries.map((k) {
                                                return DropdownMenuItem(
                                                  child: Text(k.value),
                                                  value: k.key,
                                                );
                                              }).toList(),
                                              onChanged: (item) {
                                                selectedDay.value = item!;
                                                context.read<UsersBloc>().add(
                                                    FilterProgramEvent(
                                                        id: item));
                                              }),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "اختار الطالب",
                                              style: TextStyle(
                                                  fontFamily: KFont3,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: state.program.isEmpty
                                          ? Center(
                                              child: Text(
                                                  'There IS No Dawam On This Day'),
                                            )
                                          : GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      childAspectRatio: 1.42),
                                              itemCount: state.program.length,
                                              itemBuilder: (context, index) {
                                                final Color cardColor =
                                                    index.isOdd
                                                        ? KPrimeryColor3
                                                        : KPrimeryColor2;
                                                return Card(
                                                  color: cardColor,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          " :المادة  ${state.program[index].material?.name}",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'الساعة: ${state.program[index].hour}',
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                    )
                                  ],
                                ),
                              ));
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      ));
      },
    );
  }
}
