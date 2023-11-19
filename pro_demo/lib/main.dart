import 'dart:io'; // Import this for Platform
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for SystemUiOverlayStyle
import 'package:pro_demo/providers/user_provider.dart';
import 'package:pro_demo/screens/tabs_screen.dart';
import 'package:pro_demo/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      const SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
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
        home: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            return userProvider.isLoggedIn ? TabsScreen() : LoginScreen();
          },
        ),
        routes: {
          TabsScreen.routeName: (ctx) => TabsScreen(),
        },
      ),
    );
  }
}
