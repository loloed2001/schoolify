import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:myshop/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
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
          child: ListView.builder(
           
            itemCount: 10,
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
                                        "اسم الطالب",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        " المعدل الشهري",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'الترتيب الشهري',
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
          },),
        ));
  }
}
