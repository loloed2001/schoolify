

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: 
          (){
            
          }, 
          child: Text('الصف الاول ')),
        ),
    );
  }
}
