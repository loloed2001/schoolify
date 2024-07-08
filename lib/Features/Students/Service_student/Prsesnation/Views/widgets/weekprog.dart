import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/models/weekprogram_model.dart';
import 'package:myshop/services/getweekprog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Weekprog extends StatefulWidget {
  const Weekprog({super.key});

  @override
  State<Weekprog> createState() => _WeekprogState();
}

class _WeekprogState extends State<Weekprog> {
  String? selecteditem =
      "الأحد"; // 0 - الأحد، 1 - الاثنين، 2 - الثلاثاء، 3 - الأربعاء
  List<String> weekee = [
    "الفترة الاولى",
    "الفترة الثانية",
    "الفترة الثالثة",
    "الفترة الرابعة",
    "الفترة الخامسة",
    "الفترة السادسة"
  ];

  String daytostring(int selectday) {
    // Create a map to associate day numbers with weekday strings
    Map<int, String> dayMap = {
      0: "الأحد",
      1: "الاثنين",
      2: "الثلاثاء",
      3: "الاربعاء",
      4: "الخميس",
    };
    return dayMap[selectday]!;
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
                      AppLocalizations.of(context)!.weekpro,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
        ),
        body: FutureBuilder<List<WeekprogramModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData){

            List<WeekprogramModel> week = snapshot.data!;

           
            return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Expanded(
            child: Container(
              height: 800,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButton<String>(
                            dropdownColor: KPrimeryColor2,
                            style: TextStyle(
                                color: KPrimeryColor1,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                            alignment: Alignment.centerRight,
                            value: selecteditem,
                            items: [
                              DropdownMenuItem(
                                  value: "الأحد", child: Text("الأحد")),
                              DropdownMenuItem(
                                  value: "الاثنين", child: Text("الاثنين")),
                              DropdownMenuItem(
                                  value: "الثلاثاء", child: Text("الثلاثاء")),
                              DropdownMenuItem(
                                  value: "الاربعاء", child: Text("الاربعاء")),
                              DropdownMenuItem(
                                  value: "الخميس", child: Text("الخميس")),
                            ],
                            onChanged: (item) {
                              setState(() {
                                selecteditem = item;
                               
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "اختار اليوم",
                            style: TextStyle(fontFamily: KFont3, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child:  GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.42),
                            itemCount: week.length,
                            itemBuilder: (context, index) {
                               final Color cardColor = index.isOdd ? KPrimeryColor3 : KPrimeryColor2;
                              return Card(
                                color: cardColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${weekee[index]}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: KPrimeryColor1),
                                      ),
                                      Text(
                                        " :المادة  ${week[index].material.name}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'الساعة: ${week[index].hour}',
                                        style: TextStyle(fontSize: 20),
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
            ),
          ),
        );
            }
            else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
        },

         future:  WeekprgService().getWeekprg(
                        sectionid: 1,
                      ),
        )

        );
  }
}
