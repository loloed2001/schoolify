import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/button_Widget.dart';
import 'package:myshop/Features/Students/forget_Password/Prsesnation/Views/widgets/verification_code.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';

class Code_page extends StatelessWidget {
  const Code_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimeryColor2,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Lottie.asset('assets/lottie/Animation - 1711153910692.json')
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Text(' : قم بوضع الرمز ',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: KFont2,
                    color: KPrimeryColor1,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(child: verificationcode()),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: CustomButon(
                text: 'تسجيل الدخول',
                fontSz: 24,
                colorfont: KPrimeryColor2,
                onTap: () {
                  GoRouter.of(context).push(AppRouter.KHomeStudentPage);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
