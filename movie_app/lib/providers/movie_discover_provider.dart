import 'package:flutter/material.dart';
import 'package:movie_app/models/api/movie_api.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieDiscoverProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieDiscoverProvider(this._movieRepository);

  bool _isLoding = false;
  bool get isLoding => _isLoding;

  final List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  void getDiscover(BuildContext context) async {
    _isLoding = true;
    notifyListeners();

    final result = await _movieRepository.getDiscover();

    result.fold((errorMassage) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMassage),
      ));

      _isLoding = false;
      notifyListeners();

      return;
    }, (response) {
      _movies.clear();

      _movies.addAll(response.results);

      _isLoding = false;
      notifyListeners();
      return null;
    });
  }
}
