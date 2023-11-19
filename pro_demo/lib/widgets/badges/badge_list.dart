import 'package:flutter/material.dart';

class BadgeList extends StatelessWidget {
  const BadgeList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> badges = [
      'assets/images/badge1.jpeg',
      'assets/images/badge2.jpeg',
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 120,
          width: 100,
          child: Column(
            children: [
              Image(image: AssetImage(badges[0])),
              const Text(
                "Eco Warrior",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          width: 100,
          child: Column(
            children: [
              Image(
                image: AssetImage(badges[1]),
              ),
              const Text(
                "Eco Star",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
