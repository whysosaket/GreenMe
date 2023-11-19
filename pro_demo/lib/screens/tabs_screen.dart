import 'package:flutter/material.dart';
import 'package:pro_demo/models/user.dart';
import 'package:pro_demo/providers/user_provider.dart';
import 'package:pro_demo/screens/add_post_screen.dart';
import 'package:pro_demo/screens/explore_screen.dart';
import 'package:pro_demo/screens/login_screen.dart';
import 'package:pro_demo/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  String? userImageUrl;
  bool userComplete = true;

  List<Object> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      const ExploreScreen(),
      const ProfileScreen(),
      const LoginScreen(),
      const AddPostScreen(),
    ];
  }

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).setUser(
      User(
        name: 'John Doe',
        image: 'assets/images/user.png',
        email: 'john.doe@example.com',
      ),
    );
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
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {},
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
