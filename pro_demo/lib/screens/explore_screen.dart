import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/charts/posts_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<String> users = [
    'sarthak',
    'aditya',
    'mike',
    'saket',
    'aryan',
    'milind',
  ];
  List<String> filteredUsers = [];

  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 255, 232),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    filteredUsers = users
                        .where((user) =>
                            user.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                  _removeOverlay();
                  _overlayEntry = _createOverlayEntry();
                  Overlay.of(context).insert(_overlayEntry!);
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 10, 
                itemBuilder: (context, index) {
                  return PostsCard('Username $index');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + 16.0 + 110.0,
        left: 16.0,
        right: 16.0,
        child: Material(
          elevation: 4.0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: filteredUsers
                  .map((username) => ListTile(
                        title: Text(username),
                        onTap: () {
                          // Handle user selection
                          _removeOverlay();
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }
}
