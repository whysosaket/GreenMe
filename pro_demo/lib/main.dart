import 'package:flutter/material.dart';
import 'package:pro_demo/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Me',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(1, 54, 181, 76),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: const Color.fromARGB(1, 54, 181, 76),
          ),
        ),
      ),
      home: TabsScreen(),
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
      },
    );
  }
}
