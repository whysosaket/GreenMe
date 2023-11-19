import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 8,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MUN', style: style);
      break;
    case 5:
      text = const Text('TUE', style: style);
      break;
    case 8:
      text = const Text('THR', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 8,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '1K';
      break;
    case 3:
      text = '3k';
      break;
    case 5:
      text = '5k';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
