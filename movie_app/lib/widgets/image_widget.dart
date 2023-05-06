import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    this.imageSrc,
    required this.height,
    required this.width,
    this.radius = 0,
  });

  final String? imageSrc;
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        '${Constants.imageUrlw500}$imageSrc',
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return SizedBox(
            height: height,
            width: width,
            child: const Icon(
              Icons.broken_image_rounded,
            ),
          );
        },
      ),
    );
  }
}
