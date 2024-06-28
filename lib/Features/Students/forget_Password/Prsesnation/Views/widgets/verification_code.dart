import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:myshop/constant.dart';

class verificationcode extends StatefulWidget {
  const verificationcode({super.key});

  @override
  State<verificationcode> createState() => _verificationcodeState();
}

class _verificationcodeState extends State<verificationcode> {
  var _code;
  var _onEditing;
  @override
  Widget build(BuildContext context) {
    return VerificationCode(
      underlineUnfocusedColor: KPrimeryColor1,
      fullBorder: true,
      fillColor: KPrimeryColor2,
      textStyle: TextStyle(fontSize: 20.0, color: KPrimeryColor1),
      keyboardType: TextInputType.number,
      underlineColor:
          KPrimeryColor3, // If this is null it will use primaryColor: Colors.red from Theme
      length: 5,
      cursorColor:
          KPrimeryColor3, // If this is null it will default to the ambient
      // clearAll is NOT required, you can delete it
      // takes any widget, so you can implement your design
      clearAll: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          'إعادة تعيين',
          style: TextStyle(
              fontFamily: KFont2,
              fontSize: 24.0,
              decoration: TextDecoration.underline,
              color: KPrimeryColor3),
        ),
      ),
      onCompleted: (String value) {
        setState(() {
          _code = value;
        });
      },
      onEditing: (bool value) {
        setState(() {
          _onEditing = value;
        });
        if (!_onEditing) FocusScope.of(context).unfocus();
      },
    );
  }
}
