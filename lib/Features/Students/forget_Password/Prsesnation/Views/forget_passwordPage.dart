import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/Widgets/button_Widget.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';

class Forget_passwordView extends StatefulWidget {
  Forget_passwordView({super.key});

  @override
  State<Forget_passwordView> createState() => _Forget_passwordViewState();
}

class _Forget_passwordViewState extends State<Forget_passwordView> {
  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimeryColor2,
      body: Form(
        key: _keyform,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 56,
            ),
            Text(
              'هل نسيت كلمة السر ؟  ',
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: KFont2,
                  color: KPrimeryColor1,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'قم بإدخال البريد الالكتروني المسجل ضمن التطبيق ,ثم قم بوضع الرمز المؤلف من 5 أرقام الذي سنقوم بإرساله على بريدك     ',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 18, fontFamily: KFont2, color: Colors.black54),
            ),
            SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                textAlign: TextAlign.end,
                // obscureText:obscureText!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  } else if (value.isNotEmpty && !value.contains('@')) {
                    return '@ يجب ان يحتوي البريد الإلكتروني على ';
                  }
                },
                // onChanged: onChanged,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    suffixIconColor: Colors.grey,
                    hintText: 'عنوان البريد الإلكتروني',
                    hintStyle: const TextStyle(
                        fontSize: 22,
                        fontFamily: KFont2,
                        color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: KPrimeryColor1, width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.2),
                        borderRadius: BorderRadius.circular(16)),
                    errorStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: KFont2,
                    )),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: CustomButon(
                onTap: () {
                  if (_keyform.currentState!.validate()) {
                    GoRouter.of(context).push(AppRouter.KCodeForgetPass);
                  }
                },
                text: 'المتابعة',
                fontSz: 24,
                colorfont: KPrimeryColor2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
