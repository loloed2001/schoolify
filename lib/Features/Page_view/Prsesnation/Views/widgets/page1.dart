import 'dart:ui';

import 'package:date_picker_timeline/extra/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/images/schoolbuild.jfif'),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * .9,
              right: MediaQuery.of(context).size.width * .83,
              child: TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.KSplashPage);
                },
                child: Text(
                  AppLocalizations.of(context)!.skip,
                  style: TextStyle(
                    color: KPrimeryColor1,
                    letterSpacing: MediaQuery.of(context).size.width * .0035,
                    fontSize: MediaQuery.of(context).size.aspectRatio * 36,
                  ),
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05,
                  top: MediaQuery.of(context).size.height * .6,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .01,
                      bottom: MediaQuery.of(context).size.height * .05),
                  decoration: new BoxDecoration(
                    // borderRadius: new BorderRadius.circular(10.0),
                    //shape: BoxShape.rectangle,
                    color: Colors.white.withOpacity(0.5),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.purple.shade100.withOpacity(0.4),
                        blurRadius: 5.0,
                        offset: new Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .01,
                        ),
                        child: RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                              text: AppLocalizations.of(context)!.hello,
                              style:
                                  DefaultTextStyle.of(context).style.copyWith(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            45,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                      ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Schoolify',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context)
                                              .size
                                              .aspectRatio *
                                          40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple.shade900,
                                      fontFamily: KFont,
                                      letterSpacing:
                                          MediaQuery.of(context).size.width *
                                              .006),
                                ),
                                TextSpan(
                                    text: AppLocalizations.of(context)!.page1)
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
