import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon(
      {this.onTap,
      required this.text,
      required this.fontSz,
      required this.colorfont});
  VoidCallback? onTap;
  double? fontSz;
  String text;
  Color? colorfont;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: KPrimeryColor1,
          borderRadius: BorderRadius.circular(30),
        ),
        width: MediaQuery.of(context).size.width * .5,
        height: MediaQuery.of(context).size.height * .07,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSz,
                color: colorfont,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

// class ButtonWidget extends StatelessWidget {
//   ButtonWidget({required this.text1});
//   String? text1;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return DialogCustom();
//               });
//         },
//         child: Text(
//           '$text1',
//           style: TextStyle(
//             fontFamily: 'Harmattan',
//             fontSize: 20,
//           ),
//         ),
//         style:
//             ElevatedButton.styleFrom(primary: KPrimeryColor3, elevation: 10));
//   }
// }
