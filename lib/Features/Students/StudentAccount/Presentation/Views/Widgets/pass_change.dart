import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/button_Widget.dart';
import 'package:myshop/Features/Students/forget_Password/Prsesnation/Views/widgets/verification_code.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PassChange extends StatefulWidget {
  const PassChange({super.key});

  @override
  State<PassChange> createState() => _PassChangeState();
}

class _PassChangeState extends State<PassChange> {
  final _keyform = GlobalKey<FormState>();
  String? password;
  String? confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _keyform,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .03),
              child: Text(
                AppLocalizations.of(context)!.changePass,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.aspectRatio * 53,
                    color: KPrimeryColor1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1,
                top: MediaQuery.of(context).size.height * .02,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.errorchangepass1;
                      }
                      password = value;
                    },
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.aspectRatio * 40,
                        color: Colors.black54),
                    cursorColor: Colors.grey,
                    // textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        prefixIconColor: Colors.grey,
                        hintText: AppLocalizations.of(context)!.newPass,
                        hintStyle: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.aspectRatio * 40,
                            color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: KPrimeryColor1, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.2),
                            borderRadius: BorderRadius.circular(12)),
                        errorStyle: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 35,
                        ))),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1,
                top: MediaQuery.of(context).size.height * .02,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.errorchangepass1;
                      }
                      confirmPassword = value;
                      if (password != confirmPassword) {
                        return AppLocalizations.of(context)!.errorchangepass2;
                      }
                    },
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.aspectRatio * 40,
                        color: Colors.black54),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      prefixIconColor: Colors.grey,
                      hintText: AppLocalizations.of(context)!.renewpass,
                      hintStyle: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 40,
                          color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: KPrimeryColor1, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.2),
                          borderRadius: BorderRadius.circular(12)),
                      errorStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            Center(
              child: CustomButon(
                onTap: () {
                  if (_keyform.currentState!.validate()) {
                    GoRouter.of(context).pop(context);
                  }
                },
                text: AppLocalizations.of(context)!.coniform,
                fontSz: MediaQuery.of(context).size.aspectRatio * 53,
                colorfont: KPrimeryColor2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
