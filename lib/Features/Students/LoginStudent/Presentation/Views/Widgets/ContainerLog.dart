import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/Splash_Dialog.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/button_Widget.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContainerCustomLog extends StatefulWidget {
  ContainerCustomLog({super.key});

  @override
  State<ContainerCustomLog> createState() => _ContainerCustomLogState();
}

class _ContainerCustomLogState extends State<ContainerCustomLog> {
  final _keyform = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isTextField1Valid = false;

  bool _isTextField2Valid = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .65,
      decoration: BoxDecoration(
          color: KPrimeryColor5,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(75), topRight: Radius.circular(75))),
      child: Form(
          key: _keyform,
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .1,
                    left: MediaQuery.of(context).size.width * .06,
                    right: MediaQuery.of(context).size.width * .06,
                  ),
                  child: TextFormField(
                      cursorHeight: MediaQuery.of(context).size.height * .03,
                      cursorColor: KPrimeryColor1,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationThickness: 0,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 50,
                          color: Colors.black54),
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.errorusername;
                        } else if (value.contains(RegExp(r'[0-9]'))) {
                          return AppLocalizations.of(context)!.errorusername2;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Colors.grey,
                        hintText: AppLocalizations.of(context)!.username,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 36,
                        ),
                        errorStyle: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 30,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: KPrimeryColor1, width: 1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: KPrimeryColor1, width: 1.2),
                        ),
                      ))),
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .08,
                    left: MediaQuery.of(context).size.width * .06,
                    right: MediaQuery.of(context).size.width * .06,
                  ),
                  child: TextFormField(
                      cursorHeight: MediaQuery.of(context).size.height * .03,
                      cursorColor: KPrimeryColor1,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationThickness: 0,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 50,
                          color: Colors.black54),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.errorpassword;
                        }
                      },
                      textAlign: TextAlign.start,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        prefixIconColor: Colors.grey,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            )),
                        suffixIconColor: KPrimeryColor1,
                        hintText: AppLocalizations.of(context)!.password,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 36,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: KPrimeryColor1,
                          ),
                        ),
                        errorStyle: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 30,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: KPrimeryColor1, width: 1.2),
                        ),
                      ))),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .15,
                  left: MediaQuery.of(context).size.width * .23,
                  right: MediaQuery.of(context).size.width * .23,
                ),
                child: CustomButon(
                  text: AppLocalizations.of(context)!.login,
                  fontSz: MediaQuery.of(context).size.aspectRatio * 60,
                  colorfont: KPrimeryColor3,
                  onTap: () {
                    if (_keyform.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SplashDialog();
                          });
                    }
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kForgetPassword);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.forgetpass,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 35,
                        color: KPrimeryColor1),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
