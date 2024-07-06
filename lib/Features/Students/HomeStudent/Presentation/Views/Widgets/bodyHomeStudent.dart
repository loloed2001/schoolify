import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:line_icons/line_icons.dart';

import '../../../../Chat/Prsesnation/Views/ChatPage.dart';
import '../../../../Posts/Prsesnation/Views/PostsPage.dart';
import '../../../../Service_student/Prsesnation/Views/Homepage.dart';
import '../../../../StudentAccount/Presentation/Views/StudenAccountPage.dart';
import '../../../../../../constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodyStudent extends StatefulWidget {
  const BodyStudent({super.key});

  @override
  State<BodyStudent> createState() => _BodyStudentState();
}

class _BodyStudentState extends State<BodyStudent> {
  static List<Widget> widgetOptions = [
    PostsPageView(),
    Home(),
    StudentAccountView(),
    ChatViwe(),
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedindex),
      ),
      bottomNavigationBar: Container(
        color: KPrimeryColor5,
        child: Container(
          child: GNav(
            textStyle: TextStyle(
                color: KPrimeryColor5,
                fontSize: MediaQuery.of(context).size.aspectRatio * 30,
                fontWeight: FontWeight.bold),
            tabBackgroundGradient:
                LinearGradient(begin: Alignment.bottomLeft, colors: [
              Color(0xFFE3C5E4),
              Color(0xFFCD6FD0),
              Color(0xFF9B71D2),
              Color(0xFF9B71D2),
            ]),
            backgroundColor: KPrimeryColor5,
            tabMargin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .001,
              vertical: MediaQuery.of(context).size.height * .005,
            ),
            onTabChange: (val) {
              setState(() {
                selectedindex = val;
              });
            },
            selectedIndex: selectedindex,
            hoverColor: KPrimeryColor5,
            haptic: true,
            curve: Curves.easeOutExpo,
            duration: Duration(milliseconds: 200),
            gap: MediaQuery.of(context).size.width * .03,
            color: Colors.black45,
            activeColor: KPrimeryColor5,
            iconSize: MediaQuery.of(context).size.aspectRatio * 45,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05,
              vertical: MediaQuery.of(context).size.height * .0137,
            ),
            tabs: [
              GButton(
                icon: FontAwesomeIcons.newspaper,
                text: AppLocalizations.of(context)!.post,
              ),
              GButton(
                icon: Icons.contact_support,
                text: AppLocalizations.of(context)!.service,
              ),
              GButton(
                iconSize: MediaQuery.of(context).size.aspectRatio * 55,
                icon: LineIcons.user,
                text: AppLocalizations.of(context)!.myaccount,
              ),
              GButton(
                gap: MediaQuery.of(context).size.width * .05,
                icon: FontAwesomeIcons.comments,
                text: AppLocalizations.of(context)!.chat,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
