import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pro_demo/screens/full_screen_post.dart';
import 'package:share/share.dart';

class PostsCard extends StatefulWidget {
  final String username;
  final String images;
  bool favorite;
  int likes;

  PostsCard(this.username, this.images, this.favorite, this.likes, {Key? key})
      : super(key: key);

  @override
  State<PostsCard> createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  void _toggleFavorite() {
    setState(() {
      if (widget.favorite) {
        widget.likes--;
      } else {
        widget.likes++;
      }
      widget.favorite = !widget.favorite;
    });
  }

  void _shareImage() {
    Share.share(
        'Check out this image from ${widget.username}: ${widget.images}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenPost(
              username: widget.username,
              image: widget.images,
              likes: widget.likes,
              toggleFavorite: _toggleFavorite,
              isFavorite: widget.favorite,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
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
            Hero(
              tag: widget.images, // Unique tag for the Hero animation
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey,
                child: Image.network(
                  widget.images,
                  fit: BoxFit.cover,
                ),
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
                      onPressed: _toggleFavorite,
                    ),
                    Text(widget.likes.toString()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        _shareImage();
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
