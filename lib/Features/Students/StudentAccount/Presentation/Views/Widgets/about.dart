import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ExpansionTile.dart';
import '../../../../../../constant.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .07,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .006),
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: AnimatedTextKit(totalRepeatCount: 40, animatedTexts: [
                FadeAnimatedText(
                  'Schoolify',
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.aspectRatio * 65,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade600,
                      fontFamily: KFont,
                      letterSpacing: MediaQuery.of(context).size.width * .006),
                ),
                ScaleAnimatedText(
                  'Al-Marah school',
                  duration: Duration(milliseconds: 4000),
                  textStyle: TextStyle(
                      color: Color(0xFF76E2DD),
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 85),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .02,
            ),
            child: expansion_tile(
              color2: Color(0xFFC572D3),
              colorbase: Colors.purple.shade100,
              text1: 'الموقع',
              text2: 'حلب , الشهباء الجديدة شارع الصفصاف',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          expansion_tile(
            color2: Color(0xFF6AD4CC),
            colorbase: Color(0xFFA3ECE8),
            text1: 'التاريخ',
            text2:
                'تأسست مدرسة المرح عام 2002 , كان مقرها الأساسي في منطقة المحافظة بإدارة موؤسسها الأستاد حيان الخالد',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          expansion_tile(
            color2: Color(0xFFC43DDC),
            colorbase: Color(0xFFD69DE1),
            text1: 'ابرز الأساتذة',
            text2:
                'أ.شوقي خالد , أ.محمد كيخيا , أ.قسطاكي صايغ , أ.عبدالحميد مسلاتي , أ.عصام إبراهيم , أ.عصام العبسي , أ.سميح المحمد  ',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          expansion_tile(
            color2: Color(0xFF3CC9BD),
            colorbase: Color(0xFFD0F0F0),
            text1: 'المناهج',
            text2:
                "تعتمد مدرستنا النموذجية على مناهج التعليم الوزاري بشكل أساسي بجانب إلى الكتب الخاصة بمدرسة المرح , وهي كتب باللغة الإنكليزية معددة من قبل أفضل الأساتذة في جميع المجالات ",
          ),
        ],
      ),
    ));
  }
}
