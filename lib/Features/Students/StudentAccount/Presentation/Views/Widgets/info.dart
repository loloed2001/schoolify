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
  late ValueNotifier<int?> selectedChild;

  @override
  void initState() {
    super.initState();
    selectedChild = ValueNotifier(
        (context.read<AuthBloc>().state as Authsucss).childs.firstOrNull?.id ??
            1);
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
                body: Column(
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
                                style:
                                    TextStyle(fontFamily: KFont3, fontSize: 20),
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
                                              fontWeight: FontWeight.w600),
                                          alignment: Alignment.centerRight,
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
                                                .add(GetCharts(id: item));
                                          });
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                    Expanded(
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
                                          MediaQuery.of(context).size.height *
                                              .008,
                                    ),
                                    ValueListenableBuilder(
                                        valueListenable: selectedChild,
                                        builder: (context, value, _) {
                                          return Text(
                                            state.auth!.firstName ??
                                                state.childs
                                                    .where((e) => e.id == value)
                                                    .firstOrNull
                                                    ?.firstName ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    35),
                                          );
                                        }),
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
                                          MediaQuery.of(context).size.height *
                                              .008,
                                    ),
                                    ValueListenableBuilder(
                                        valueListenable: selectedChild,
                                        builder: (context, value, _) {
                                          return Text(
                                            DateFormat.yMMMd().format(
                                              state.childs
                                                      .where(
                                                          (e) => e.id == value)
                                                      .firstOrNull
                                                      ?.birtDate ??
                                                  state.auth!.birtDate ??
                                                  state.childs
                                                      .where(
                                                          (e) => e.id == value)
                                                      .firstOrNull
                                                      ?.birtDate ??
                                                  DateTime.now(),
                                            ),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    35),
                                          );
                                        }),
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
                              endIndent:
                                  MediaQuery.of(context).size.height * .05,
                              thickness:
                                  MediaQuery.of(context).size.aspectRatio * 1.5,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.fatherName,
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
                                          MediaQuery.of(context).size.height *
                                              .008,
                                    ),
                                    ValueListenableBuilder(
                                        valueListenable: selectedChild,
                                        builder: (context, value, _) {
                                          return Text(
                                            userState.userInfo?.parent
                                                    ?.fatherName ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    35),
                                          );
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.motherName,
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
                                          MediaQuery.of(context).size.height *
                                              .008,
                                    ),
                                    ValueListenableBuilder(
                                        valueListenable: selectedChild,
                                        builder: (context, value, _) {
                                          return Text(
                                            userState.userInfo?.parent
                                                    ?.motherName ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    35),
                                          );
                                        }),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: KPrimeryColor4,
                              indent: MediaQuery.of(context).size.height * .05,
                              endIndent:
                                  MediaQuery.of(context).size.height * .05,
                              thickness:
                                  MediaQuery.of(context).size.aspectRatio * 1.5,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .08,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .academicyear,
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
                                          MediaQuery.of(context).size.height *
                                              .008,
                                    ),
                                    ValueListenableBuilder(
                                        valueListenable: selectedChild,
                                        builder: (context, value, _) {
                                          return Text(
                                            userState
                                                    .userInfo
                                                    ?.getStudentInfoResponseModelClass
                                                    ?.name ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    35),
                                          );
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .divisionNumber,
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
                                          MediaQuery.of(context).size.height *
                                              .008,
                                    ),
                                    ValueListenableBuilder(
                                        valueListenable: selectedChild,
                                        builder: (context, value, _) {
                                          return Text(
                                            userState.userInfo?.section?.name ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    35),
                                          );
                                        }),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: KPrimeryColor4,
                              indent: MediaQuery.of(context).size.height * .05,
                              endIndent:
                                  MediaQuery.of(context).size.height * .05,
                              thickness:
                                  MediaQuery.of(context).size.aspectRatio * 1.5,
                            ),
                            Row(
                              children: [
                                pichart(
                                  average: userState.charts?.markAverage ?? 8,
                                ),
                                picharthodor(
                                    average: userState
                                            .charts?.isPresentPercentage
                                            ?.toDouble() ??
                                        28.0)
                              ],
                            )
                          ]);
                        },
                      ),
                    ),
                  ],
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
