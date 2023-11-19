import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/badges/badge_list.dart';

class BadgesCard extends StatelessWidget {
  const BadgesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: SizedBox(
          width: width / 1.1,
          height: height / 4.7,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  bottom: 5,
                ),
                child: Text(
                  "My Awards",
                  style: TextStyle(
                    color: Color.fromARGB(255, 31, 31, 31),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              BadgeList(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
