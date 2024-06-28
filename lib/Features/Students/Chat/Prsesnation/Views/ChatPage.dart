import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/Chat/Prsesnation/Views/widgets/chatBubble.dart';
import 'package:myshop/Features/Students/Chat/Prsesnation/Views/widgets/containerChat.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatViwe extends StatelessWidget {
  const ChatViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimeryColor5,
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
        title: Center(
            child: Text(
          AppLocalizations.of(context)!.chat,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.aspectRatio * 50,
              color: KPrimeryColor5),
        )),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Container_chat(
          //   image: AssetImage('assets/images/teacher.jpg'),
          //   color: Color(0xFFFEC163),
          //   text: 'المشرف',
          //   ontap: () {
          //     GoRouter.of(context).push(AppRouter.KchatParents);
          //   },
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * .025,
          // ),
          // Divider(
          //   color: KPrimeryColor4,
          //   indent: MediaQuery.of(context).size.height * .05,
          //   thickness: MediaQuery.of(context).size.aspectRatio * 1.5,
          // ),
          Container_chat(
            image: AssetImage('assets/images/ad.png'),
            color: KPrimeryColor1,
            text: AppLocalizations.of(context)!.adv,
            ontap: () {
              GoRouter.of(context).push(AppRouter.KAdchat);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Divider(
            color: KPrimeryColor4,
            indent: MediaQuery.of(context).size.height * .05,
            thickness: MediaQuery.of(context).size.aspectRatio * 1.5,
          ),
        ],
      ),
    );
  }
}
