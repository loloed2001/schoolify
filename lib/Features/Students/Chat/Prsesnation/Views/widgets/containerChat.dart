import 'package:flutter/material.dart';
import 'package:myshop/constant.dart';

class Container_chat extends StatelessWidget {
  Container_chat(
      {this.ontap,
      required this.text,
      required this.color,
      required this.image});
  VoidCallback? ontap;
  Color? color;
  String? text;
  AssetImage? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * .1,
        width: MediaQuery.of(context).size.width * 1,
        //color: Colors.amber,
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .04,
              right: MediaQuery.of(context).size.width * .04,
              top: MediaQuery.of(context).size.height * .02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  // Color(0xFFFEC163),
                  radius: MediaQuery.of(context).size.aspectRatio * 70,
                  child: CircleAvatar(
                    backgroundColor: KPrimeryColor5,
                    radius: MediaQuery.of(context).size.aspectRatio * 68,
                    backgroundImage: image,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(
                      '$text',
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 40,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .009,
                    ),
                    Text(
                      'مرحبا',
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 36,
                          letterSpacing:
                              MediaQuery.of(context).size.width * .003,
                          color: Colors.black38,
                          fontFamily: KFont2,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
