import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/contribute_card.dart';

class ContributeScreen extends StatefulWidget {
  const ContributeScreen({Key? key}) : super(key: key);

  @override
  _ContributeScreenState createState() => _ContributeScreenState();
}

class _ContributeScreenState extends State<ContributeScreen> {
  List<String> topics = ['Clean City','Save water','Clean River','Say no to Plastic'];
  List<String> imgs = ['assets/images/clean_city.jpg', 'assets/images/clean_river.jpg', 'assets/images/no_plastic.jpg', 'assets/images/save_water.jpg'];
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
                color: const Color.fromARGB(255, 246, 247, 246).withOpacity(0.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 180, 180, 180),
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Color.fromARGB(179, 168, 168, 168)),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    filteredUsers = topics
                        .where((user) =>
                            user.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });

                  // Close existing overlay
                  _removeOverlay();

                  // Show overlay with search results
                  _overlayEntry = _createOverlayEntry();
                  Overlay.of(context).insert(_overlayEntry!);
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 4, // Display some content (posts) here
                itemBuilder: (context, index) {
                  return ContributeCard(topics[index], imgs[index]);
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
