import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

enum TypeScrImg { movieDB, external }

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    this.imageSrc,
    this.type = TypeScrImg.movieDB,
    this.height,
    this.width,
    this.onTap,
    this.radius = 0,
  });

  final String? imageSrc;
  final TypeScrImg type;
  final double? height;
  final double? width;
  final void Function()? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.network(
            type == TypeScrImg.movieDB
                ? '${Constants.imageUrlw500}$imageSrc'
                : imageSrc!,
            height: height,
            width: width,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              return Container(
                height: height,
                width: width,
                color: Colors.black26,
                child: child,
              );
            },
            errorBuilder: (_, __, ___) {
              return SizedBox(
                height: height,
                width: width,
                child: const Icon(Icons.broken_image_rounded),
              );
            },
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(onTap: onTap),
          ),
        ),
      ],
    );
  }
}
