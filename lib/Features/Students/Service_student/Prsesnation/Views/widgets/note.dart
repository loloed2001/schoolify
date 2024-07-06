import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:intl/intl.dart';
import '../../../../../../constant.dart';

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
  int _currentMonth = 1;

  void _changeMonth(int monthDelta) {
    setState(() {
      _currentMonth += monthDelta;
      if (_currentMonth < 1) {
        _currentMonth = 12;
      } else if (_currentMonth > 12) {
        _currentMonth = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final monthName = _getMonthName(_currentMonth);
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
        title: Center(
            child: Text(
          "الملاحظات",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              //       decoration: BoxDecoration(

              // border: Border.all(color: Colors.grey),
              // borderRadius: BorderRadius.circular(8.0),
              //       ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => _changeMonth(-1),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: KPrimeryColor1,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text('$monthName ${DateTime.now().year}'))),
                  IconButton(
                    onPressed: () => _changeMonth(1),
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
            Padding(
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
                  border: Border.all(color: KPrimeryColor1, width: 2),
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
                                    fontSize: 20, color: Colors.black),
                              ),
                              TextSpan(
                                text: "مديحة ",
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
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: DateFormat.yMMMd().format(DateTime.now()),
                                style: TextStyle(
                                    fontFamily: KFont2,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 59, 59, 59),
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: "   ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
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
                                    fontSize: 20, color: Colors.black),
                              ),
                              TextSpan(
                                text: "نشيط ",
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
                    ]),
              ),
            ),
            Padding(
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
                  border: Border.all(color: KPrimeryColor1, width: 2),
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
                                    fontSize: 20, color: Colors.black),
                              ),
                              TextSpan(
                                text: "مديحة ",
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
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: DateFormat.yMMMd().format(DateTime.now()),
                                style: TextStyle(
                                    fontFamily: KFont2,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 59, 59, 59),
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: "   ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
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
                                    fontSize: 20, color: Colors.black),
                              ),
                              TextSpan(
                                text: "نشيط ",
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
                    ]),
              ),
            ),
            Padding(
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
                  border: Border.all(color: KPrimeryColor1, width: 2),
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
                                    fontSize: 20, color: Colors.black),
                              ),
                              TextSpan(
                                text: "مديحة ",
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
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: DateFormat.yMMMd().format(DateTime.now()),
                                style: TextStyle(
                                    fontFamily: KFont2,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 59, 59, 59),
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: "   ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
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
                                    fontSize: 20, color: Colors.black),
                              ),
                              TextSpan(
                                text: "نشيط ",
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
                    ]),
              ),
            ),
          ],
        ),
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
