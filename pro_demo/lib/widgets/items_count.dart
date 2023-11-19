import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/category_count_widget.dart';

class ItemsCount extends StatelessWidget {
  const ItemsCount({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryCountWidget(
          count: 10,
          category: 'Overall',
        ),
        CategoryCountWidget(
          count: 5,
          category: 'Eco Points',
        ),
        CategoryCountWidget(
          count: 8,
          category: 'Pal Points',
        ),
      ],
    );
  }
}
