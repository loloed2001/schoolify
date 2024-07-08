import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myshop/Features/DialogLogin/Presentation/Widget/CircleImage.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/ContainerLog.dart';
import 'package:myshop/Features/Students/StudentAccount/Presentation/Views/Widgets/Container_widget.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/main.dart';

class StudentAccountView extends StatelessWidget {
  const StudentAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
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
              height: MediaQuery.of(context).size.height * .15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                CircleImageCustom(
                    image: AssetImage('assets/images/studentAccount.jpg'),
                    ontap: () {}),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                Text(
                  'تيم لاجين',
                  style: TextStyle(
                      fontFamily: KFont2,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 70,
                      color: KPrimeryColor2,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Expanded(child: ContainerWidget()),
          ],
        ));
  }
}
