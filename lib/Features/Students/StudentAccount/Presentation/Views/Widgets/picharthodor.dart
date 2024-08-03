import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../../constant.dart';

class picharthodor extends StatelessWidget {
  picharthodor({
    Key? key,
    required this.average,
  }) : super(key: key);
  final double average;
  final colorList = <Color>[KPrimeryColor1];

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      AppLocalizations.of(context)!.hodorAvrage: average / 10,
    };

    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * .01),
      child: PieChart(
        chartLegendSpacing: MediaQuery.of(context).size.aspectRatio * 30,
        ringStrokeWidth: MediaQuery.of(context).size.width * 0.2,
        dataMap: dataMap,
        chartType: ChartType.disc,
        baseChartColor: KPrimeryColor4,
        chartRadius: MediaQuery.of(context).size.width * .25,
        animationDuration: const Duration(seconds: 3),
        chartValuesOptions: const ChartValuesOptions(
            chartValueStyle: TextStyle(fontFamily: KFont, color: Colors.grey),
            showChartValues: true,
            showChartValuesOutside: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false),
        // Set the options for the legend of the pie chart
        legendOptions: LegendOptions(
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.aspectRatio * 30,
            ),
            legendPosition: LegendPosition.bottom,
            showLegendsInRow: true),
        colorList: colorList,
        // chartValuesOptions: ChartValuesOptions(
        //   showChartValuesInPercentage: true,
        // ),
        totalValue: 30,
      ),
    );
  }
}
