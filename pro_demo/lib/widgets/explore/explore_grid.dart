import 'package:flutter/material.dart';

class ExploreGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: 30, // Adjust the number of items as needed
      itemBuilder: (context, index) {
        // You can replace this with your custom card or widget
        return Image.network(
          'https://placekitten.com/100/100', // Example image URL
          fit: BoxFit.cover,
        );
      },
    );
  }
}
