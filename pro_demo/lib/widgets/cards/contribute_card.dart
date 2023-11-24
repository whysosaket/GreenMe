import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContributeCard extends StatefulWidget {
  String username;
  String imgAddres;
  ContributeCard(this.username, this.imgAddres, {super.key});

  @override
  State<ContributeCard> createState() => _ContributeCardState();
  var favorite = false;
}

class _ContributeCardState extends State<ContributeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
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
                        widget.username,
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
              width: 300,
              height: 200,
              color: Colors.grey,
              child: Image.asset(
                widget.imgAddres,
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
                      icon: Icon(
                        widget.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.favorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.favorite = !widget.favorite;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Fund it!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.monetization_on,
                        size: 30,
                        color: Colors.green,
                      ),
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
}
