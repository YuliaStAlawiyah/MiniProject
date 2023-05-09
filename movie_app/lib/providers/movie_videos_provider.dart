import 'package:flutter/material.dart';
import 'package:movie_app/models/api/movie_api.dart';
import 'package:movie_app/models/movie_videos_model.dart';

class MovieVideosProvider with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieVideosProvider(this._movieRepository);

  MovieVideosModel? _videos;
  MovieVideosModel? get videos => _videos;

  void getVideos(BuildContext context, {required int id}) async {
    _videos = null;
    notifyListeners();
    final result = await _movieRepository.getVideos(id: id);
    result.fold(
      (messageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(messageError)),
        );
        _videos = null;
        notifyListeners();
        return;
      },
      (response) {
        _videos = response;
        notifyListeners();
        return;
      },
    );
  }
}
