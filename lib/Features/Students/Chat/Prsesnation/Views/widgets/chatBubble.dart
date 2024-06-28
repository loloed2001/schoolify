import 'package:flutter/material.dart';
import 'package:myshop/constant.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .12,
            right: MediaQuery.of(context).size.width * .07,
            top: MediaQuery.of(context).size.height * .015,
            bottom: MediaQuery.of(context).size.height * .02),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: KPrimeryColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          'مرحبا',
          style: TextStyle(
            fontFamily: KFont2,
            fontWeight: FontWeight.w400,
            fontSize: MediaQuery.of(context).size.aspectRatio * 35,
            color: KPrimeryColor5,
          ),
        ),
      ),
    );
  }
}

class ChatBubbleFreind extends StatelessWidget {
  const ChatBubbleFreind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        // height: MediaQuery.of(context).size.height * .07,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .12,
            right: MediaQuery.of(context).size.width * .07,
            top: MediaQuery.of(context).size.height * .015,
            bottom: MediaQuery.of(context).size.height * .02),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .02,
          vertical: MediaQuery.of(context).size.height * .01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: KPrimeryColor1,
        ),
        child: Text(
          'مرحبا',
          style: TextStyle(
            fontFamily: KFont2,
            fontWeight: FontWeight.w400,
            fontSize: MediaQuery.of(context).size.aspectRatio * 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
