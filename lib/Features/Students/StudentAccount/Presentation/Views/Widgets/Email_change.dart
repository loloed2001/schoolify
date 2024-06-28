import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/button_Widget.dart';
import 'package:myshop/Features/Students/forget_Password/Prsesnation/Views/widgets/verification_code.dart';
import 'package:myshop/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myshop/core/Utils/app_router.dart';

class EmailChange extends StatefulWidget {
  EmailChange({super.key});

  @override
  State<EmailChange> createState() => _EmailChangeState();
}

class _EmailChangeState extends State<EmailChange> {
  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimeryColor5,
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
                AppLocalizations.of(context)!.changeEmail,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.aspectRatio * 55,
                    color: KPrimeryColor1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .02,
              ),
              child: Text(
                AppLocalizations.of(context)!.inputEmail,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.aspectRatio * 40,
                    letterSpacing: MediaQuery.of(context).size.width * .002,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .03,
              ),
              child: TextFormField(
                  cursorHeight: MediaQuery.of(context).size.height * .03,
                  cursorColor: KPrimeryColor1,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                      color: Colors.black54),
                  textAlign: TextAlign.start,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmail1;
                    } else if (value.isNotEmpty && !value.contains('@')) {
                      return AppLocalizations.of(context)!.errorEmail2;
                    }
                  },
                  // onChanged: onChanged,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.aspectRatio * 30,
                      letterSpacing: MediaQuery.of(context).size.width * .002,
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                    prefixIconColor: Colors.grey,
                    hintText: AppLocalizations.of(context)!.emailAdress,
                    hintStyle: TextStyle(
                        letterSpacing: MediaQuery.of(context).size.width * .002,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: KPrimeryColor1, width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.2),
                        borderRadius: BorderRadius.circular(16)),
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Center(
              child: CustomButon(
                onTap: () {
                  if (_keyform.currentState!.validate()) {
                    GoRouter.of(context).push(AppRouter.KchangeCode);
                  }
                },
                text: AppLocalizations.of(context)!.continu,
                fontSz: MediaQuery.of(context).size.aspectRatio * 50,
                colorfont: KPrimeryColor2,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Code_page_change extends StatelessWidget {
  const Code_page_change({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Lottie.asset('assets/lottie/Animation - 1711153910692.json')
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .2,
            ),
            child: Text(AppLocalizations.of(context)!.putDigit,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.aspectRatio * 55,
                    color: KPrimeryColor1,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .05,
            ),
            child: Center(child: verificationcode()),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .03,
            ),
            child: Center(
              child: CustomButon(
                text: 'التاكيد',
                fontSz: MediaQuery.of(context).size.aspectRatio * 50,
                colorfont: KPrimeryColor2,
                onTap: () {
                  GoRouter.of(context).pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
