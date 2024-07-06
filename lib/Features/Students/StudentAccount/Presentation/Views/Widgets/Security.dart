import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../constant.dart';
import '../../../../../../core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Security_View extends StatelessWidget {
  const Security_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //     child: SfPdfViewer.network(
      //         'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf')));
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
        title: Text(AppLocalizations.of(context)!.security,
            style: TextStyle(
                color: KPrimeryColor1,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.aspectRatio * 55,
                letterSpacing: MediaQuery.of(context).size.width * .002)),
      ),
      body: Column(
        children: [
          infoCustom(
            icons: Icon(Icons.email_outlined),
            text: AppLocalizations.of(context)!.emailAdress,
            pass_em: 'taim@gmail.com',
            onpress: () {
              GoRouter.of(context).push(AppRouter.KemailChange);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          infoCustom(
            icons: Icon(Icons.password),
            text: AppLocalizations.of(context)!.password,
            pass_em: 'taim_la',
            onpress: () {
              GoRouter.of(context).push(AppRouter.Kpasschnage);
            },
          ),
        ],
      ),
    );
  }
}

class infoCustom extends StatelessWidget {
  infoCustom(
      {required this.text,
      required this.pass_em,
      required this.onpress,
      required this.icons});
  String? text;
  String? pass_em;
  VoidCallback? onpress;
  Icon? icons;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * .03,
      ),
      Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .04,
          right: MediaQuery.of(context).size.width * .05,
        ),
        child: Text(
          '$text',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: KPrimeryColor1,
            fontSize: MediaQuery.of(context).size.aspectRatio * 42,
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * .002,
      ),
      Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .033,
          right: MediaQuery.of(context).size.width * .0033,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .01,
                    left: MediaQuery.of(context).size.width * .01,
                    right: MediaQuery.of(context).size.width * .01,
                  ),
                  child: TextFormField(
                    enabled: false,
                    showCursor: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: icons,
                      prefixIconColor: Colors.grey,
                      border: InputBorder.none,
                      hintText: '$pass_em',
                      hintStyle: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 37,
                          fontFamily: KFont3,
                          letterSpacing:
                              MediaQuery.of(context).size.width * .002,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                  )),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(8, 3))
                ],
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Colors.grey.withOpacity(.5), width: 2),
                color: KPrimeryColor5,
              ),
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.width * .8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .02,
            ),
            IconButton(
                onPressed: onpress,
                icon: Icon(
                  Icons.edit,
                  color: KPrimeryColor1,
                  size: MediaQuery.of(context).size.aspectRatio * 60,
                )),
          ],
        ),
      ),
    ]);
  }
}
