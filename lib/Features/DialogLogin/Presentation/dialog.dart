import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../constant.dart';
import '../../../core/Utils/app_router.dart';
import '../../../core/shared/shared_preferences_service.dart';
import 'Widget/CircleImage.dart';

class DialogCustom extends StatelessWidget {
  const DialogCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: KPrimeryColor5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          height: MediaQuery.of(context).size.height * .32,
          width: MediaQuery.of(context).size.width * 2,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .02,
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.logintype,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                      color: KPrimeryColor1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    CircleImageCustom(
                      ontap: () {
                        SharedPreferencesService.storeType('Students');

                        GoRouter.of(context).go(AppRouter.KStudentLoginPage);
                      },
                      image: AssetImage('assets/images/Students.png'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(
                      AppLocalizations.of(context)!.student,
                      style: TextStyle(
                        letterSpacing:
                            MediaQuery.of(context).size.aspectRatio * .002,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35,
                        color: KPrimeryColor1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleImageCustom(
                      ontap: () {
                        SharedPreferencesService.storeType('Parents');
                        GoRouter.of(context).go(AppRouter.KStudentLoginPage);
                      },
                      image: AssetImage('assets/images/family.png'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(
                      AppLocalizations.of(context)!.parents,
                      style: TextStyle(
                        letterSpacing:
                            MediaQuery.of(context).size.aspectRatio * .002,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35,
                        color: KPrimeryColor1,
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ));
  }
}
