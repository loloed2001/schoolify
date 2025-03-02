import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:myshop/Features/Students/StudentAccount/data/bloc/users_bloc.dart';
import 'package:myshop/core/widgets/main_error_widget.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/shared/request_status.dart';
import '../../../../../../core/shared/shared_preferences_service.dart';
import '../../../../LoginStudent/data/bloc/auth_bloc.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
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
            GetRanking(
              id: (context.read<AuthBloc>().state as Authsucss)
                      .childs
                      .firstOrNull
                      ?.id ??
                  1,
            ),
          );
    } else {
      context.read<UsersBloc>().add(
            GetRanking(
              id: (context.read<AuthBloc>().state as Authsucss).auth!.id!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            AppLocalizations.of(context)!.lesson,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              return state.ranksStatus == RequestStatus.failed
                  ? Center(
                      child: MainErrorWidget(onPressed: () {
                        if (SharedPreferencesService.getType() == 'Parents') {
                          context.read<UsersBloc>().add(
                                GetRanking(
                                  id: (context.read<AuthBloc>().state
                                              as Authsucss)
                                          .childs
                                          .firstOrNull
                                          ?.id ??
                                      1,
                                ),
                              );
                        } else {
                          context.read<UsersBloc>().add(
                                GetRanking(
                                  id: (context.read<AuthBloc>().state
                                          as Authsucss)
                                      .auth!
                                      .id!,
                                ),
                              );
                        }
                      }),
                    )
                  : state.ranksStatus == RequestStatus.success
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
                                    BlocBuilder<AuthBloc, AuthState>(
                                      builder: (context, state) {
                                        return ValueListenableBuilder(
                                            valueListenable: selectedChild,
                                            builder: (context, value, _) {
                                              return DropdownButton<int>(
                                                  dropdownColor: KPrimeryColor2,
                                                  style: TextStyle(
                                                      color: KPrimeryColor1,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  value: value,
                                                  items: (state as Authsucss)
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
                                                        .add(GetRanking(
                                                            id: item));
                                                  });
                                            });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            Expanded(
                              child: state.ranks.isEmpty
                                  ? Center(child: Text('There Is No Data'))
                                  : ListView.builder(
                                      itemCount: state.ranks.length,
                                      itemBuilder: (context, index) {
                                        final Color cardColor = index.isOdd
                                            ? KPrimeryColor3
                                            : KPrimeryColor2;
                                        return Card(
                                          color: cardColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!
                                                          .studname +
                                                      ' ' +
                                                      (state.ranks[index]
                                                              .fullName ??
                                                          ''),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                          .avgmonth +
                                                      " " +
                                                      state.ranks[index].average
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
            },
          ),
        ));
  }
}
