import 'package:flutter/material.dart';

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
        // appBar: GradientAppBar(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     colors: [
        //       //KPrimeryColor2,
        //       Color(0xFFCD6FD0),
        //       Color(0xFF9B71D2),
        //       Color(0xFF9B71D2),
        //       // Color(0xFF703EA9),
        //       Color(0xFFCD6FD0),
        //     ],
        //   ),
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.arrow_back)),
        //   title: Center(
        //       child: Text(
        //     "برنامج الأسبوع",
        //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //   )),
        // ),
        // body: FutureBuilder<List<WeekprogramModel>>(
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData){

        //     List<WeekprogramModel> week = snapshot.data!;

        //     List<WeekprogramModel> filterweek = snapshot.data!
        //           .where((exam) => exam.day.compareTo() == 0)
        //           .toList();
        //     return SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Expanded(
        //     child: Container(
        //       height: 800,
        //       child: Column(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(10),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 DropdownButton<String>(
        //                     dropdownColor: KPrimeryColor2,
        //                     style: TextStyle(
        //                         color: KPrimeryColor1,
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.w600),
        //                     alignment: Alignment.centerRight,
        //                     value: selecteditem,
        //                     items: [
        //                       DropdownMenuItem(
        //                           value: "الأحد", child: Text("الأحد")),
        //                       DropdownMenuItem(
        //                           value: "الاثنين", child: Text("الاثنين")),
        //                       DropdownMenuItem(
        //                           value: "الثلاثاء", child: Text("الثلاثاء")),
        //                       DropdownMenuItem(
        //                           value: "الاربعاء", child: Text("الاربعاء")),
        //                       DropdownMenuItem(
        //                           value: "الخميس", child: Text("الخميس")),
        //                     ],
        //                     onChanged: (item) {
        //                       setState(() {
        //                         selecteditem = item;
        //                         selectday = selecteditem! as int;
        //                       });
        //                     }),
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 10),
        //                   child: Text(
        //                     "اختار اليوم",
        //                     style: TextStyle(fontFamily: KFont3, fontSize: 20),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Expanded(
        //             flex: 4,
        //             child:  GridView.builder(
        //                     gridDelegate:
        //                         SliverGridDelegateWithFixedCrossAxisCount(
        //                             crossAxisCount: 2, childAspectRatio: 1.42),
        //                     itemCount: week.length,
        //                     itemBuilder: (context, index) {
        //                       return Card(
        //                         child: Padding(
        //                           padding: const EdgeInsets.all(16.0),
        //                           child: Column(
        //                             crossAxisAlignment: CrossAxisAlignment.end,
        //                             children: [
        //                               Text(
        //                                 "${weekee[index]}",
        //                                 style: TextStyle(
        //                                     fontSize: 22,
        //                                     fontWeight: FontWeight.bold,
        //                                     color: KPrimeryColor1),
        //                               ),
        //                               Text(
        //                                 " :المادة  ${filterweek[index].material.name}",
        //                                 style: TextStyle(
        //                                   fontSize: 20,
        //                                   fontWeight: FontWeight.bold,
        //                                 ),
        //                               ),
        //                               Text(
        //                                 'الساعة: ${filterweek[index].hour}',
        //                                 style: TextStyle(fontSize: 20),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                   ),

        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // );
        //     }
        //     else if (snapshot.hasError) {
        //       return Text('Error: ${snapshot.error}');
        //     } else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        // },

        //  future:  WeekprgService().getWeekprg(
        //                 sectionid: 1,
        //               ),
        // )

        );
  }
}
