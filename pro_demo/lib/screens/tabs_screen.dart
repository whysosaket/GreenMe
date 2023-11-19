import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pro_demo/models/user.dart';
import 'package:pro_demo/providers/user_provider.dart';
import 'package:pro_demo/screens/add_post_screen.dart';
import 'package:pro_demo/screens/explore_screen.dart';
import 'package:pro_demo/screens/leaderboard_screen.dart';
import 'package:pro_demo/screens/login_screen.dart';
import 'package:pro_demo/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Object> _pages = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _loadUserData();
    });
    _pages = [
      const ExploreScreen(),
      const ProfileScreen(),
      const LeaderboardScreen(),
      const AddPostScreen(),
    ];
  }

  Future<void> _loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? userDataString = prefs.getString('user');
      if (userDataString != null) {
        final Map<String, dynamic> userData = json.decode(userDataString);
        final User newUser = User.fromJson(userData);

        Provider.of<UserProvider>(context, listen: false).setUser(newUser);
      }
    } catch (error) {
      print('Failed to load user data from shared preferences: $error');
    }
  }

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Green Me',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 255, 232),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(
                Icons.leaderboard,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaderboardScreen()),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                UserProvider().logout();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: const Color.fromARGB(255, 243, 255, 232),
        unselectedItemColor: const Color.fromARGB(255, 165, 165, 165),
        selectedItemColor: const Color.fromARGB(255, 64, 180, 83),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.person_2),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.notifications),
            label: 'Contribute',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.add_circle,
              color: Color.fromARGB(255, 64, 180, 83),
              size: 35,
            ),
            activeIcon: const Icon(
              Icons.edit_note,
              size: 35,
            ),
            label: 'Add post',
          ),
        ],
      ),
    );
  }
}
