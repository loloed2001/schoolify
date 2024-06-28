import 'package:flutter/material.dart';
import 'package:myshop/Features/Students/Chat/Prsesnation/Views/widgets/chatBubble.dart';
import 'package:myshop/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdChat extends StatelessWidget {
  const AdChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KPrimeryColor5,
        appBar: AppBar(
          title: Center(
              child: Text(
            AppLocalizations.of(context)!.adv,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                color: KPrimeryColor5),
          )),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: KPrimeryColor1,
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ChatBubbleFreind();
            }),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .02,
              bottom: MediaQuery.of(context).size.height * .02,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .04,
              width: MediaQuery.of(context).size.width * .95,
              child: Container(
                color: KPrimeryColor5,
                child: Text(
                  AppLocalizations.of(context)!.apply,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 35,
                      color: KPrimeryColor1),
                ),
              ),
            ),
          )
        ]));
  }
}
