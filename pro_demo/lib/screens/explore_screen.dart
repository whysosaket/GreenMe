import 'dart:math';

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
  List<String> usernames = [
    "Milind",
    "Diksha",
    "Uditya",
    "Fabiha",
    "Milind",
    "Uditya"
  ];

  List<String> posts = [
    "https://media.istockphoto.com/id/603849184/photo/group-of-young-people-traveling-by-bus-taking-selfie.jpg?s=612x612&w=0&k=20&c=nFumcbHmc1q-BQA9KCjRYDGuqeB9nTf2nqxM_wYgP_A=",
    "https://assets.gogetfunding.com/wp-content/uploads/2017/10/5371021/img/21686432_387895234958388_3992434569949286641_n.jpg",
    "https://i.natgeofe.com/n/b76b398b-77fa-463d-9ab3-0d4c8fdfb39b/Boys-Biking_Family-cycling_FAMILY_0922.jpg?w=374&h=297",
    "https://assets.materialup.com/uploads/d2ab50e4-c3e2-4d4a-a702-d921050238b9/preview.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQHK1dBv5Rlngmyipr4KZ_e0nxx-nIL1fMm6zAoBTf38c-3GXso-1p0RV-pAjG23VELow&usqp=CAU",
    "https://media.istockphoto.com/id/1135086373/vector/badges-and-reward-flat-rounded-icons-set.jpg?s=612x612&w=0&k=20&c=Lbv2CifvOOUmlz7-1lRlXQw-yfXsBAvJZy1H1W7iANY="
  ];

  final offset = Random().nextInt(100);

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
                itemCount: usernames.length,
                itemBuilder: (context, index) {
                  index += offset;
                  index %= usernames.length;
                  return PostsCard(usernames[index], posts[index]);
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
