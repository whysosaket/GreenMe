import 'package:pro_demo/widgets/charts/line_chart.dart';
import 'package:flutter/material.dart';

class StepsCard extends StatelessWidget {
  const StepsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 7,
      width: width,
      child: ListTile(
        leading: const Icon(
          Icons.nordic_walking,
          color: Color.fromARGB(255, 106, 193, 149),
          size: 95,
        ),
        subtitle: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: height / 7,
          child: const LineChartSample2(),
        ),
        title: const Text(
          'Steps Per Day',
          style: TextStyle(
            color: Color.fromARGB(255, 34, 34, 34),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
