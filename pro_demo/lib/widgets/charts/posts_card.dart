import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostsCard extends StatefulWidget {
  String username;
  String images;
  PostsCard(this.username, this.images, {super.key});

  @override
  State<PostsCard> createState() => _PostsCardState();
  var favorite = false;
}

class _PostsCardState extends State<PostsCard> {
  var _likes = 0;

  // set likes to a random number between 0 and 100
  @override
  void initState() {
    super.initState();
    _likes = Random().nextInt(100);
  }

  void _increaseLikes() {
    setState(() {
      _likes++;
    });
  }

  void _decreaseLikes() {
    setState(() {
      _likes--;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-Images.png',
                        ),
                        backgroundColor: Colors.white,
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
              width: double.infinity,
              height: 200,
              color: Colors.grey,
              child: Image.network(
                widget.images,
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
                        if (widget.favorite) {
                          _decreaseLikes();
                        } else {
                          _increaseLikes();
                        }
                        setState(() {
                          widget.favorite = !widget.favorite;
                        });
                      },
                    ),
                    Text(_likes.toString()),
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
}
