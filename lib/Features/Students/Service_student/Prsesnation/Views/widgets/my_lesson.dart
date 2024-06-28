

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
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
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return pdfv();
            }));
          }, 
          child: Text('الصف الاول ')),
        ),
    );
  }
}

class pdfv extends StatefulWidget {
  const pdfv({super.key});

  @override
  State<pdfv> createState() => _pdfvState();
}

class _pdfvState extends State<pdfv> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      body:
      PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
       
      ).fromAsset('assets/pdf/Social-G1.pdf'),
 
      // PDF().cachedFromUrl(
      //   'https://drive.google.com/file/d/1CShF9nDQzftW1VEL-ZihCMU00CbZGj7e/view',
      //   placeholder: ( double progress) => Center(child: Text('$progress %'),),
      //   errorWidget: ( dynamic error) => Center(child: Text(error.toString()),),
      //   ),
    );
  }
}