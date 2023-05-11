import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/model/movie_model.dart';

void main() {
  group('MovieResponseModel', () {
    test('should create an instance of MovieResponseModel from a valid map',
        () {
      final map = {
        "results": [
          {
            "backdrop_path": "/backdrop_path1.jpg",
            "id": 1,
            "overview": "Overview 1",
            "poster_path": "/poster_path1.jpg",
            "title": "Movie 1",
            "vote_average": 7.5,
            "vote_count": 100
          },
          {
            "backdrop_path": "/backdrop_path2.jpg",
            "id": 2,
            "overview": "Overview 2",
            "poster_path": "/poster_path2.jpg",
            "title": "Movie 2",
            "vote_average": 8.2,
            "vote_count": 200
          }
        ],
        "total_pages": 2,
        "total_results": 2
      };
      final movieResponseModel = MovieResponseModel.fromMap(map);

      expect(movieResponseModel.results.length, 2);
      expect(movieResponseModel.totalPages, 2);
      expect(movieResponseModel.totalResults, 2);

      final movie1 = movieResponseModel.results[0];
      expect(movie1.backdropPath, "/backdrop_path1.jpg");
      expect(movie1.id, 1);
      expect(movie1.overview, "Overview 1");
      expect(movie1.posterPath, "/poster_path1.jpg");
      expect(movie1.title, "Movie 1");
      expect(movie1.voteAverage, 7.5);
      expect(movie1.voteCount, 100);

      final movie2 = movieResponseModel.results[1];
      expect(movie2.backdropPath, "/backdrop_path2.jpg");
      expect(movie2.id, 2);
      expect(movie2.overview, "Overview 2");
      expect(movie2.posterPath, "/poster_path2.jpg");
      expect(movie2.title, "Movie 2");
      expect(movie2.voteAverage, 8.2);
      expect(movie2.voteCount, 200);
    });
  });

  group('MovieModel', () {
    test('should create an instance of MovieModel from a valid map', () {
      final map = {
        "backdrop_path": "/backdrop_path.jpg",
        "id": 1,
        "overview": "Movie overview",
        "poster_path": "/poster_path.jpg",
        "title": "Movie",
        "vote_average": 7.8,
        "vote_count": 150
      };

      final moviemodel = MovieModel.fromMap(map);

      expect(moviemodel.backdropPath, "/backdrop_path.jpg");
      expect(moviemodel.id, 1);
      expect(moviemodel.overview, "Movie overview");
      expect(moviemodel.posterPath, "/poster_path.jpg");
      expect(moviemodel.title, "Movie");
      expect(moviemodel.voteAverage, 7.8);
      expect(moviemodel.voteCount, 150);
    });
  });
}
