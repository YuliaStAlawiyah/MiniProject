import 'package:flutter/material.dart';
import 'package:movie_app/model/api/movie_api.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieTopRatedProvider with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieTopRatedProvider(this._movieRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  void getTopRated(BuildContext context) async {
    final result = await _movieRepository.getTopRated();

    result.fold(
      (messageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(messageError)),
        );

        _isLoading = false;
        notifyListeners();

        return;
      },
      (response) {
        _movies.clear();
        _movies.addAll(response.results);

        _isLoading = false;
        notifyListeners();

        return;
      },
    );
  }
}
