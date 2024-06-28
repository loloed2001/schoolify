import 'package:flutter/material.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/ContainerLog.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/button_Widget.dart';
import 'package:myshop/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StudentloginView extends StatelessWidget {
  const StudentloginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, colors: [
              KPrimeryColor2,
              Color(0xFFCD6FD0),
              Color(0xFF9B71D2),
              Color(0xFF9B71D2),
              Color(0xFF703EA9),
              Color(0xFFCD6FD0),
            ])),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                Center(
                  child: Text(
                    'Schoolify',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.aspectRatio * 90,
                      fontWeight: FontWeight.w300,
                      color: Colors.purple.shade50,
                      fontFamily: KFont,
                      letterSpacing: MediaQuery.of(context).size.height * .002,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                ),
                Expanded(child: ContainerCustomLog())
              ],
            )));
  }
}
