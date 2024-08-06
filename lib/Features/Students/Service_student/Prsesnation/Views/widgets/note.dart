import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:myshop/Features/Students/StudentAccount/data/bloc/users_bloc.dart';
import 'package:myshop/core/shared/request_status.dart';
import 'package:myshop/core/widgets/main_error_widget.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/shared/shared_preferences_service.dart';
import '../../../../LoginStudent/data/bloc/auth_bloc.dart';

String _getMonthName(int month) {
  switch (month) {
    case 1:
      return 'يناير';
    case 2:
      return 'فبراير';
    case 3:
      return 'مارس';
    case 4:
      return 'أبريل';
    case 5:
      return 'مايو';
    case 6:
      return 'يونيو';
    case 7:
      return 'يوليو';
    case 8:
      return 'أغسطس';
    case 9:
      return 'سبتمبر';
    case 10:
      return 'أكتوبر';
    case 11:
      return 'نوفمبر';
    case 12:
      return 'ديسمبر';
    default:
      return '';
  }
}

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
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
            GetNotes(
              id: (context.read<AuthBloc>().state as Authsucss)
                      .childs
                      .firstOrNull
                      ?.id ??
                  1,
            ),
          );
    } else {
      context.read<UsersBloc>().add(
            GetNotes(
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
          AppLocalizations.of(context)!.note,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
                      style: TextStyle(fontFamily: KFont3, fontSize: 20),
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
                                items: (state as Authsucss).childs.map((k) {
                                  return DropdownMenuItem(
                                    child: Text(k.firstName!),
                                    value: k.id!,
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  selectedChild.value = item!;
                                  context
                                      .read<UsersBloc>()
                                      .add(GetNotes(id: item));
                                });
                          });
                    },
                  ),
                ],
              ),
            ),
          Expanded(
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                return state.notesStatus == RequestStatus.success
                    ? state.notes.isEmpty
                        ? Center(
                            child: Text('There Is No Notes Now'),
                          )
                        : ListView.builder(
                            itemCount: state.notes.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 6,
                                        color: Colors.grey.withOpacity(0.5),
                                        offset: Offset(8, 3))
                                  ],
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: KPrimeryColor1, width: 2),
                                  color: KPrimeryColor2,
                                ),
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width * .95,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: " اسم المشرف" ":",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: KFont,
                                                    fontWeight: FontWeight.bold,
                                                    color: KPrimeryColor1),
                                              ),
                                              TextSpan(
                                                text: "   ",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: state.notes[index]
                                                    .supervisor?.firstName,
                                                style: TextStyle(
                                                    fontFamily: KFont,
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
                                        padding: const EdgeInsets.all(5.0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: DateFormat.yMMMd().format(
                                                    state.notes[index]
                                                            .createDate ??
                                                        DateTime.now()),
                                                style: TextStyle(
                                                    fontFamily: KFont2,
                                                    fontSize: 17,
                                                    color: Color.fromARGB(
                                                        255, 59, 59, 59),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              TextSpan(
                                                text: "   ",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: " التاريخ" "",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: KFont,
                                                    fontWeight: FontWeight.bold,
                                                    color: KPrimeryColor1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: " المتابعة" ":",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: KFont,
                                                    fontWeight: FontWeight.bold,
                                                    color: KPrimeryColor1),
                                              ),
                                              TextSpan(
                                                text: "   ",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: state.notes[index]
                                                        .description ??
                                                    '',
                                                style: TextStyle(
                                                    fontFamily: KFont,
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
                                    ]),
                              ),
                            ),
                          )
                    : state.notesStatus == RequestStatus.failed
                        ? Center(child: MainErrorWidget(onPressed: () {
                            context
                                .read<UsersBloc>()
                                .add(GetNotes(id: selectedChild.value ?? 1));
                          }))
                        : Center(
                            child: CircularProgressIndicator(),
                          );
              },
            ),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Column(

      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             children: [
      //               Container(
      //                 margin: EdgeInsets.symmetric(horizontal: 20),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       DateFormat.yMMM().format(DateTime.now()),
      //                       style: TextStyle(
      //                           fontSize: 22, fontWeight: FontWeight.w600),
      //                     ),
      //                     Text(
      //                       "Today",
      //                       style: TextStyle(
      //                           fontSize: 24,
      //                           fontWeight: FontWeight.bold,
      //                           color: KPrimeryColor1),
      //                     )
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         Container(
      //           child:
      //            DatePicker(

      //             DateTime.now(),
      //             height: 120,
      //             width: 80,
      //             initialSelectedDate: DateTime.now(),
      //             selectionColor: KPrimeryColor1,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Container(
      //                                     decoration: BoxDecoration(
      //                 boxShadow: [
      //                   BoxShadow(
      //                       blurRadius: 6,
      //                       color: Colors.grey.withOpacity(0.5),
      //                       offset: Offset(8, 3))
      //                 ],
      //                 borderRadius: BorderRadius.circular(18),
      //                 border: Border.all(color: KPrimeryColor1, width: 2),
      //                 color: KPrimeryColor2,
      //                                     ),
      //                                     height: MediaQuery.of(context).size.height * .2,
      //                                     width: MediaQuery.of(context).size.width * .95,
      //                                      child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 children: [
      //                   Padding(
      //                 padding: const EdgeInsets.all(5),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: " اسم المشرف" ":",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),
      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                       TextSpan(
      //                         text: "مديحة ",
      //                         style: TextStyle(
      //                           fontFamily: KFont,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                                     ),
      //                   Padding(
      //                 padding: const EdgeInsets.all(5.0),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: DateFormat.yMMMd().format(DateTime.now()) ,
      //                         style: TextStyle(
      //                           fontFamily: KFont2,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),

      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                        TextSpan(
      //                         text: " التاريخ" "",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                                     ),
      //                                     Padding(
      //                 padding: const EdgeInsets.all(5),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: " المتابعة" ":",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),
      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                       TextSpan(
      //                         text: "نشيط ",
      //                         style: TextStyle(
      //                           fontFamily: KFont,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                                     ),
      //                 ]
      //                                    ),
      //                                   ),
      //               ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Container(
      //               decoration: BoxDecoration(
      //                 boxShadow: [
      //                   BoxShadow(
      //                       blurRadius: 6,
      //                       color: Colors.grey.withOpacity(0.5),
      //                       offset: Offset(8, 3))
      //                 ],
      //                 borderRadius: BorderRadius.circular(18),
      //                 border: Border.all(color: KPrimeryColor1, width: 2),
      //                 color: KPrimeryColor2,
      //               ),
      //               height: MediaQuery.of(context).size.height * .2,
      //               width: MediaQuery.of(context).size.width * .95,
      //                child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 children: [
      //                   Padding(
      //                 padding: const EdgeInsets.all(5),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: " اسم المشرف" ":",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),
      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                       TextSpan(
      //                         text: "مديحة ",
      //                         style: TextStyle(
      //                           fontFamily: KFont,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //                   Padding(
      //                 padding: const EdgeInsets.all(5.0),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: DateFormat.yMMMd().format(DateTime.now()) ,
      //                         style: TextStyle(
      //                           fontFamily: KFont2,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                        TextSpan(
      //                         text: " التاريخ" "",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),

      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(5),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: " المتابعة" ":",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),
      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                       TextSpan(
      //                         text: "نشيط ",
      //                         style: TextStyle(
      //                           fontFamily: KFont,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //                 ]
      //              ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Container(
      //               decoration: BoxDecoration(
      //                 boxShadow: [
      //                   BoxShadow(
      //                       blurRadius: 6,
      //                       color: Colors.grey.withOpacity(0.5),
      //                       offset: Offset(8, 3))
      //                 ],
      //                 borderRadius: BorderRadius.circular(18),
      //                 border: Border.all(color: KPrimeryColor1, width: 2),
      //                 color: KPrimeryColor2,
      //               ),
      //               height: MediaQuery.of(context).size.height * .2,
      //               width: MediaQuery.of(context).size.width * .95,
      //                child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 children: [
      //                   Padding(
      //                 padding: const EdgeInsets.all(5),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: " اسم المشرف" ":",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),
      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                       TextSpan(
      //                         text: "مديحة ",
      //                         style: TextStyle(
      //                           fontFamily: KFont,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //                   Padding(
      //                 padding: const EdgeInsets.all(5.0),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: DateFormat.yMMMd().format(DateTime.now()) ,
      //                         style: TextStyle(
      //                           fontFamily: KFont2,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                        TextSpan(
      //                         text: " التاريخ" "",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),

      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(5),
      //                 child: RichText(
      //                   text: TextSpan(
      //                     children: [
      //                       TextSpan(
      //                         text: " المتابعة" ":",
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: KFont,
      //                             fontWeight: FontWeight.bold,
      //                             color: KPrimeryColor1),
      //                       ),
      //                       TextSpan(
      //                         text: "   ",
      //                         style: TextStyle(fontSize: 20, color: Colors.black),
      //                       ),
      //                       TextSpan(
      //                         text: "نشيط ",
      //                         style: TextStyle(
      //                           fontFamily: KFont,
      //                             fontSize: 17,
      //                             color: Color.fromARGB(255, 59, 59, 59),
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //                 ]
      //              ),
      //             ),
      //           ),

      //             ],
      //           ),
      //         )
      //         ]
      //         ),
      // ),
    );
  }
}

// */  Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             blurRadius: 6,
//                             color: Colors.grey.withOpacity(0.5),
//                             offset: Offset(8, 3))
//                       ],
//                       borderRadius: BorderRadius.circular(18),
//                       border: Border.all(color: KPrimeryColor1, width: 2),
//                       color: KPrimeryColor2,
//                     ),
//                     height: MediaQuery.of(context).size.height * .2,
//                     width: MediaQuery.of(context).size.width * .95,
//                      child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: " اسم المشرف" ":",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: KFont,
//                                   fontWeight: FontWeight.bold,
//                                   color: KPrimeryColor1),
//                             ),
//                             TextSpan(
//                               text: "   ",
//                               style: TextStyle(fontSize: 20, color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: "مديحة  ",
//                               style: TextStyle(
//                                 fontFamily: KFont,
//                                   fontSize: 17,
//                                   color: Color.fromARGB(255, 59, 59, 59),
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                         Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: RichText(
//                         text: TextSpan(
//                           children: [
//                              TextSpan(
//                               text: DateFormat.yMMMd().format(DateTime.now()),
//                               style: TextStyle(
//                                 fontFamily: KFont3,
//                                   fontSize: 17,
//                                   color: Color.fromARGB(255, 59, 59, 59),
//                                   fontWeight: FontWeight.w600),
//                             ),

//                             TextSpan(
//                               text: "   ",
//                               style: TextStyle(fontSize: 20, color: Colors.black),
//                             ),
//                            TextSpan(
//                               text: " :التاريخ" ,
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: KFont,
//                                   fontWeight: FontWeight.bold,
//                                   color: KPrimeryColor1),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: " المتابعة" ":",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: KFont,
//                                   fontWeight: FontWeight.bold,
//                                   color: KPrimeryColor1),
//                             ),
//                             TextSpan(
//                               text: "   ",
//                               style: TextStyle(fontSize: 20, color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: "نشيط ",
//                               style: TextStyle(
//                                 fontFamily: KFont,
//                                   fontSize: 17,
//                                   color: Color.fromARGB(255, 59, 59, 59),
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),*/
