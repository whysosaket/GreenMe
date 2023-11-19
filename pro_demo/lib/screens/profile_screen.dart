import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/steps_card.dart';
import 'package:pro_demo/widgets/user_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 255, 232),
      body: SizedBox(
        height: height,
        width: width,
        child: const Column(
          children: [
            UserCard(),
            StepsCard(),
          ],
        ),
      ),
    );
  }
}
