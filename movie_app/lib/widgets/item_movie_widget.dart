import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/widgets/image_widget.dart';

class ItemMovie extends Container {
  final MovieModel movie;
  final double radius;
  final MovieDetailModel? movieDetail;
  final double heightPoster;
  final double widthPoster;
  final void Function()? onTap;

  ItemMovie({
    required this.heightPoster,
    required this.widthPoster,
    required this.movie,
    this.movieDetail,
    this.onTap,
    this.radius = 12,
    super.key,
  });

  @override
  Clip get clipBehavior => Clip.hardEdge;

  @override
  Decoration? get decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      );

  @override
  Widget? get child => Stack(
        children: [
          ImageWidget(
            imageSrc: movie.backdropPath,
            height: 300,
            width: double.infinity,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWidget(
                  imageSrc: movie.posterPath,
                  height: 160,
                  width: 100,
                  radius: 12,
                ),
                const SizedBox(height: 8),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      '${movie.voteAverage} (${movie.voteCount})',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          )
        ],
      );
}
