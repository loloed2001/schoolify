import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myshop/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimeryColor5,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.KStudentAccount);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: KPrimeryColor1,
            size: MediaQuery.of(context).size.aspectRatio * 60,
          ),
        ),
        backgroundColor: KPrimeryColor5,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.lang,
          style: TextStyle(
              color: KPrimeryColor1,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.aspectRatio * 55,
              letterSpacing: MediaQuery.of(context).size.width * .002),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .05,
            left: MediaQuery.of(context).size.width * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Text(
              AppLocalizations.of(context)!.changelang,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                  color: KPrimeryColor1,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            textWidget(
              lang: AppLocalizations.of(context)!.arabic,
              ontap: () {},
              image: 'assets/images/syria.png',
            ),
            Divider(
              color: KPrimeryColor4,
              indent: MediaQuery.of(context).size.height * .01,
              // endIndent: MediaQuery.of(context).size.height * .00003,
              thickness: MediaQuery.of(context).size.aspectRatio * 1.8,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            textWidget(
              lang: AppLocalizations.of(context)!.english,
              ontap: () {},
              image: 'assets/images/britain.png',
            ),
            Divider(
              color: KPrimeryColor4,
              indent: MediaQuery.of(context).size.height * .01,
              // endIndent: MediaQuery.of(context).size.height * .00003,
              thickness: MediaQuery.of(context).size.aspectRatio * 1.8,
            ),
          ],
        ),
      ),
    );
  }
}

class textWidget extends StatelessWidget {
  textWidget({required this.lang, required this.ontap, required this.image});
  String? lang;
  VoidCallback? ontap;
  String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            '$image',
            height: MediaQuery.of(context).size.height * .04,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Text(
            '$lang',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.aspectRatio * 45,
                color: Colors.black45,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
