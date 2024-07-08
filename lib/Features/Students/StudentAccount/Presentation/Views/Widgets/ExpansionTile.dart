import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshop/constant.dart';

class expansion_tile extends StatelessWidget {
  expansion_tile(
      {required this.colorbase,
      required this.text1,
      required this.text2,
      required this.color2});

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  String? text1;
  String? text2;
  Color? colorbase;
  Color? color2;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .03),
        child: ExpansionTileCard(
          expandedTextColor: color2,
          baseColor: colorbase,
          expandedColor: KPrimeryColor5,
          key: cardB,
          title: Text(
            '$text1',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.aspectRatio * 36,
                fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            Divider(
              color: Colors.black,
              thickness: .3,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  //horizontal: MediaQuery.of(context).size.height * .01,
                  vertical: MediaQuery.of(context).size.height * .02,
                ),
                child: Text(
                  "$text2",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 33,
                      fontWeight: FontWeight.w400),
                )),
          ],
        ),
      ),
    );
  }
}
