import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/Utils/app_router.dart';
import '../../../../../../core/shared/shared_preferences_service.dart';
import '../../../../LoginStudent/data/bloc/auth_bloc.dart';
import '../../../data/bloc/users_bloc.dart';
import 'pichart.dart';
import 'picharthodor.dart';

class Info_student extends StatefulWidget {
  const Info_student({super.key});

  @override
  State<Info_student> createState() => _Info_studentState();
}

class _Info_studentState extends State<Info_student> {
  @override
  void initState() {
    super.initState();
    if (SharedPreferencesService.getType() == 'Parents') {
      context.read<UsersBloc>().add(
            GetCharts(
              id: (context.read<AuthBloc>().state as Authsucss)
                      .childs
                      .firstOrNull
                      ?.id ??
                  1,
            ),
          );
    } else {
      context.read<UsersBloc>().add(
            GetCharts(
              id: (context.read<AuthBloc>().state as Authsucss).auth!.id!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authsucss)
          return BlocBuilder<UsersBloc, UsersState>(
            builder: (context, userState) {
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop(AppRouter.KStudentAccount);
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: KPrimeryColor1,
                      size: MediaQuery.of(context).size.aspectRatio * 60,
                    ),
                  ),
                  backgroundColor: KPrimeryColor5,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(AppLocalizations.of(context)!.schoolinfo,
                      style: TextStyle(
                          color: KPrimeryColor1,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 50,
                          letterSpacing:
                              MediaQuery.of(context).size.width * .002)),
                ),
                body: SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: KPrimeryColor1,
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .aspectRatio *
                                          35),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .008,
                                ),
                                Text(
                                  state.auth!.firstName!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .aspectRatio *
                                          35),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.date,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: KPrimeryColor1,
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .aspectRatio *
                                          35),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .008,
                                ),
                                Text(
                                  DateFormat.yMMMd()
                                      .format(state.auth!.birtDate!),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .aspectRatio *
                                          35),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Divider(
                          color: KPrimeryColor4,
                          indent: MediaQuery.of(context).size.height * .05,
                          endIndent: MediaQuery.of(context).size.height * .05,
                          thickness:
                              MediaQuery.of(context).size.aspectRatio * 1.5,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .08,
                        ),
                        Row(
                          children: [
                            pichart(
                              average: userState.charts?.markAverage ?? 8,
                            ),
                            picharthodor(
                                average: userState.charts?.isPresentPercentage
                                        ?.toDouble() ??
                                    28.0)
                          ],
                        )
                      ]);
                    },
                  ),
                ),
              );
            },
          );
        else {
          return SizedBox();
        }
      },
    );
  }
}
