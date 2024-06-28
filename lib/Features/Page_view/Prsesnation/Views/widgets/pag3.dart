import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/button_Widget.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/images/parentpageview.jfif'),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .67,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05,
                  //top: MediaQuery.of(context).size.height * .4,
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
                          horizontal: MediaQuery.of(context).size.width * .02,
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: AppLocalizations.of(context)!.parentspage3,
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
                                  text: AppLocalizations.of(context)!
                                      .service1page3,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .aspectRatio *
                                        45,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .service2page3,
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .service3page3,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .aspectRatio *
                                        45,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink.shade800,
                                  ),
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .service4page3,
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!.safe,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .aspectRatio *
                                        45,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink.shade500,
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .01,
                ),
                child: ElevatedButton(
                  child: Text(
                    AppLocalizations.of(context)!.getstart,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.KSplashPage);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: KPrimeryColor1,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .25,
                          vertical: MediaQuery.of(context).size.height * .005),
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                        letterSpacing:
                            MediaQuery.of(context).size.height * .002,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
