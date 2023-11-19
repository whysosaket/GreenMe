import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<String> users = ['user1', 'user2', 'user3', 'user4', 'user5'];
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

                  // Close existing overlay
                  _removeOverlay();

                  // Show overlay with search results
                  _overlayEntry = _createOverlayEntry();
                  Overlay.of(context)!.insert(_overlayEntry!);
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 10, // Display some content (posts) here
                itemBuilder: (context, index) {
                  return buildUserCard('Username $index');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserCard(String username) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            // Top Bar
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green.withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          'https://placehold.co/50/png',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        username,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            // Image Box
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey,
              child: Image.network(
                'https://placehold.co/150/png',
                fit: BoxFit.cover,
              ),
            ),
            // Like and Share Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        // Handle like button press
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        // Handle share button press
                      },
                    ),
                  ],
                ),
              ],
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
