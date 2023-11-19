import 'package:flutter/material.dart';

class CategoryCountWidget extends StatelessWidget {
  final int count;
  final String category;

  const CategoryCountWidget(
      {super.key, required this.count, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green, // Use your desired color
          ),
          child: Center(
            child: Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          category,
          style: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
            color: Colors.green, // Use your desired color
          ),
        ),
      ],
    );
  }
}
