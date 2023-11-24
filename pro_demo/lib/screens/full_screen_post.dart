import 'package:flutter/material.dart';
import 'package:share/share.dart';

class FullScreenPost extends StatelessWidget {
  final String username;
  final String image;
  final int likes;

  void _shareImage() {
    Share.share('Check out this image from $username: $image');
  }

  FullScreenPost(
      {required this.username,
      required this.image,
      required this.likes,
      required void Function() toggleFavorite,
      required bool isFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image Box
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black, // Background color
            child: Image.network(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
          // Top Bar
          Container(
            padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.white),
                      onPressed: () {
                        // Implement like functionality here
                      },
                    ),
                    Text(
                      likes.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {
                    _shareImage();
                  },
                ),
              ],
            ),
          ),
          // Bottom Bar
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     padding: const EdgeInsets.all(16),
          //     color: Colors.transparent,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         IconButton(
          //           icon:
          //               const Icon(Icons.favorite_border, color: Colors.white),
          //           onPressed: () {
          //             // Implement like functionality here
          //           },
          //         ),
          //         IconButton(
          //           icon: const Icon(Icons.comment, color: Colors.white),
          //           onPressed: () {
          //             // Implement comment functionality here
          //           },
          //         ),
          //         IconButton(
          //           icon: const Icon(Icons.send, color: Colors.white),
          //           onPressed: () {
          //             // Implement direct message functionality here
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
