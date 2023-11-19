import 'package:pro_demo/widgets/items_count.dart';

import 'line_chart.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 7,
      width: width,
      child: ListTile(
        leading: const Icon(
          Icons.shopping_cart,
          color: Color.fromARGB(255, 106, 193, 149),
          size: 95,
        ),
        subtitle: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: height / 5,
          child: const ItemsCount(),
        ),
        title: const Text(
          'Your Shopping Style',
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
