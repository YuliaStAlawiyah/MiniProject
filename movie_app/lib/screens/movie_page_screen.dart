import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_discover_provider.dart';
import 'package:provider/provider.dart';

class MoviePageScreen extends StatelessWidget {
  const MoviePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) { 
    context.read<MovieDiscoverProvider>().getDiscover(context);
    });
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: Consumer<MovieDiscoverProvider>(
        builder: (_, provider, __){
          if (provider.isLoding) {
            return const Center(
              child: CircularProgressIndicator(),
            );            
          }
          if (provider.movies.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = provider.movies[index];

                return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
               );
              }
            );
          }
          return const Center(
            child: Text('Not Found Discover Movies'),
          );
        },
      ),
    );
  }
}