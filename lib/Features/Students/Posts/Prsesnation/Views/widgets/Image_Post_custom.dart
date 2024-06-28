import 'package:flutter/material.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        child: Image.asset(
          'assets/images/postTese.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
