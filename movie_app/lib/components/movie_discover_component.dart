import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_discover_provider.dart';
import 'package:movie_app/screens/movie_detail_page_screen.dart';
import 'package:movie_app/widgets/item_movie_widget.dart';
import 'package:provider/provider.dart';

class MovieDiscaverComponent extends StatefulWidget {
  const MovieDiscaverComponent({super.key});

  @override
  State<MovieDiscaverComponent> createState() => _MovieDiscaverComponentState();
}

class _MovieDiscaverComponentState extends State<MovieDiscaverComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieDiscoverProvider>().getDiscover(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<MovieDiscoverProvider>(
        builder: (_, provider, __) {
          if (provider.isLoding) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black12]),
                // color: Colors.black12,
                // borderRadius: BorderRadius.circular(10),
              ),
            );
          }
          if (provider.movies.isNotEmpty) {
            return CarouselSlider.builder(
              itemCount: provider.movies.length,
              itemBuilder: (_, index, __) {
                final movie = provider.movies[index];
                return ItemMovie(
                  movie: movie,
                  heightBackdrop: 300,
                  widthBackdrop: double.infinity,
                  heightPoster: 160,
                  widthPoster: 100,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MovieDetailPageScreen(id: movie.id);
                        },
                      ),
                    );
                  },
                );
              },
              options: CarouselOptions(
                height: 300,
                viewportFraction: 0.8,
                reverse: false,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            );
          }
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Not found discover movies',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
