import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int score = 30; // Initial score

  @override
  Widget build(BuildContext context) {
    String globeLocation;

    if (score < 20) {
      globeLocation = 'assets/images/globe_red.svg';
    } else if (score < 50) {
      globeLocation = 'assets/images/globe_yellow.svg';
    } else {
      globeLocation = 'assets/images/globe_green.svg';
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 255, 232),
      body: Center(
        child: SvgPicture.asset(
          globeLocation,
          height: MediaQuery.of(context).size.height * 0.7,
        ),
      ),
    );
  }
}
