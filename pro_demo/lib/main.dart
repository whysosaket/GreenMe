import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_demo/models/user.dart';
import 'package:pro_demo/providers/leaderboard_provider.dart';
import 'package:pro_demo/providers/user_provider.dart';
import 'package:pro_demo/screens/tabs_screen.dart';
import 'package:pro_demo/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => LeaderboardProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      const SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return MaterialApp(
      title: 'Green Me',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(1, 54, 181, 76),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(1, 54, 181, 76),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(background: Colors.blueGrey),
      ),
      home: FutureBuilder<bool>(
        future: checkUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.data!) {
            return LoginScreen();
          } else {
            // Use the existing provider
            return TabsScreen();
          }
        },
      ),
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
      },
    );
  }

  Future<bool> checkUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? userDataString = prefs.getString('user');
      return userDataString != null;
    } catch (error) {
      print('Failed to load user data from shared preferences: $error');
      return false;
    }
  }
}
