import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:myshop/services/getexamprog.dart';

import '../../../../../../constant.dart';
import '../../../../../../models/Examprogram_model.dart';

class Examprog extends StatefulWidget {
  const Examprog({super.key});

  @override
  State<Examprog> createState() => _ExamprogState();
}

class _ExamprogState extends State<Examprog> {
  DateTime? selectedDate = DateTime.now();
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
          title: Center(
              child: Text(
            AppLocalizations.of(context)!.exampro,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ),
        body: FutureBuilder<List<ExamprogramModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ExamprogramModel> exam = snapshot.data!;

              return Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.yMMMd().format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
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
                      selectionColor: KPrimeryColor1,
                      onDateChange: (_selectedDate) {
                        selectedDate = _selectedDate;
                        final list = exam.where((element) {
                          return element.date.day == selectedDate?.day &&
                              element.date.month == selectedDate?.month;
                        }).toList();
                        print(list);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2,
                        mainAxisSpacing: 20),
                    itemCount: exam.length,
                    itemBuilder: (context, index) => Container(
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
                                        text: " المادة" ":",
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
                                        text: "${exam[index].name}",
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
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: " الساعة" ":",
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
                                        text: "${exam[index].date.hour}",
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
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: " الصف" ":",
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
                                        text: exam[index]
                                            .examprogramModelClass
                                            .name,
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
                            ])),
                  ),
                ),
              ]);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          future: GetExamprogram().getexamprog(sectionid: 1),
        ));
  }
}
