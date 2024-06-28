import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/StudentAccount/Presentation/Views/Widgets/pichart.dart';
import 'package:myshop/Features/Students/StudentAccount/Presentation/Views/Widgets/picharthodor.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Info_student extends StatelessWidget {
  const Info_student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text(AppLocalizations.of(context)!.schoolinfo,
              style: TextStyle(
                  color: KPrimeryColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                  letterSpacing: MediaQuery.of(context).size.width * .002)),
        ),
        body: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: KPrimeryColor1,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .008,
                  ),
                  Text(
                    'تيم لاجين',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.date,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: KPrimeryColor1,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .008,
                  ),
                  Text(
                    '9/4/2019',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Divider(
            color: KPrimeryColor4,
            indent: MediaQuery.of(context).size.height * .05,
            endIndent: MediaQuery.of(context).size.height * .05,
            thickness: MediaQuery.of(context).size.aspectRatio * 1.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.fatherName,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: KPrimeryColor1,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .008,
                  ),
                  Text(
                    'إياد لاجين',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.motherName,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: KPrimeryColor1,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .008,
                  ),
                  Text(
                    'متيم مكي',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Divider(
            color: KPrimeryColor4,
            indent: MediaQuery.of(context).size.height * .05,
            endIndent: MediaQuery.of(context).size.height * .05,
            thickness: MediaQuery.of(context).size.aspectRatio * 1.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.academicyear,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: KPrimeryColor1,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .008,
                  ),
                  Text(
                    'الأول',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.divisionNumber,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: KPrimeryColor1,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .008,
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
          Row(
            children: [pichart(), picharthodor()],
          )
        ]));
  }
}
