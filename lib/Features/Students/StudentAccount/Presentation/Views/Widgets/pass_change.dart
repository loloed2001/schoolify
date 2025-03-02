import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/LoginStudent/data/bloc/auth_bloc.dart';

import '../../../../../../constant.dart';
import '../../../../LoginStudent/Presentation/Views/Widgets/button_Widget.dart';
import '../../../data/bloc/users_bloc.dart';

class PassChange extends StatefulWidget {
  const PassChange({super.key});

  @override
  State<PassChange> createState() => _PassChangeState();
}

class _PassChangeState extends State<PassChange> {
  final _keyform = GlobalKey<FormState>();
  String? oldpassword;
  String? newPassword;
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
                      oldpassword = value;
                      return null;
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
                      newPassword = value;
                      // if (password != confirmPassword) {
                      //   return AppLocalizations.of(context)!.errorchangepass2;
                      // }
                      // return null;
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
                    context.read<UsersBloc>().add(EditPassword(
                        id: (context.read<AuthBloc>().state as Authsucss)
                            .auth!
                            .id!,
                        password: oldpassword!,
                        newPassword: newPassword!));
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
