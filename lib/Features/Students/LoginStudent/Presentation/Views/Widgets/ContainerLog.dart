import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../constant.dart';
import '../../../../forget_Password/Prsesnation/Views/forget_passwordPage.dart';
import '../../../data/bloc/auth_bloc.dart';
import 'Splash_Dialog.dart';
import 'button_Widget.dart';

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

  final TextEditingController emailcontoller = TextEditingController();
  final TextEditingController passwordcontoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is Authloading) {
          BotToast.showLoading(clickClose: false);
        } else if (state is Authsucss) {
          BotToast.closeAllLoading();

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SplashDialog();
              });
        } else {
          BotToast.closeAllLoading();

          BotToast.showText(text: "Try Again");
        }
      },
      child: Container(
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
                        controller: emailcontoller,
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
                            return AppLocalizations.of(context)!.errorEmail1;
                          } else if (value.isNotEmpty && !value.contains('@')) {
                            return AppLocalizations.of(context)!.errorEmail2;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Colors.grey,
                          hintText: AppLocalizations.of(context)!.emailAdress,
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
                            borderSide: const BorderSide(
                                color: KPrimeryColor1, width: 1),
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
                        controller: passwordcontoller,
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
                          return null;
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
                    onTap: () async {
                      if (_keyform.currentState!.validate()) {
                        context.read<AuthBloc>().add(loginEvent(
                            email: emailcontoller.text,
                            password: passwordcontoller.text));
                        SharedPreferences _shared =
                            await SharedPreferences.getInstance();
                        _shared.setString('email', emailcontoller.text);

                        _shared.setString('pass', passwordcontoller.text);
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Forget_passwordView()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.forgetpass,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 35,
                          color: KPrimeryColor1),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
