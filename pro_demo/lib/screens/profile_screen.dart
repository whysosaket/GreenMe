import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/badges/badge_card.dart';
import 'package:pro_demo/widgets/user/shopping_card.dart';
import 'package:pro_demo/widgets/user/steps_card.dart';
import 'package:pro_demo/widgets/user/user_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 255, 232),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserCard(),
            StepsCard(),
            ShoppingCard(),
            BadgesCard(),
          ],
        ),
      ),
    );
  }
}
