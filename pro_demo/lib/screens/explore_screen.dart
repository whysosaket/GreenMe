// explore_screen.dart

import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/explore/explore_grid.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExploreGrid(),
    );
  }
}
