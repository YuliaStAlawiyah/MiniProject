import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/model/api/movie_api.dart';
import 'package:movie_app/model/movie_detail_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/model/movie_videos_model.dart';

class MockMovieRepository extends MovieRepository {
  @override
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1}) {
    final movieResponse =
        MovieResponseModel(results: [], totalPages: 2, totalResults: 2);
    return Future.value(Right(movieResponse));
  }

  @override
  Future<Either<String, MovieResponseModel>> getTopRated({int page = 1}) {
    final movieResponse =
        MovieResponseModel(results: [], totalPages: 2, totalResults: 2);
    return Future.value(Right(movieResponse));
  }

  @override
  Future<Either<String, MovieResponseModel>> search({required String query}) {
    final movieResponse =
        MovieResponseModel(results: [], totalPages: 2, totalResults: 2);
    return Future.value(Right(movieResponse));
  }

  @override
  Future<Either<String, MovieDetailModel>> getDetail({required int id}) {
    final movieDetail = MovieDetailModel(
        budget: 100000000,
        genres: [],
        homepage: '',
        id: 123,
        overview: '',
        popularity: 7.8,
        releaseDate: DateTime(2023 - 05 - 01),
        revenue: 250000000,
        status: '',
        tagline: '',
        title: '',
        voteAverage: 8.5,
        voteCount: 1000);
    return Future.value(Right(movieDetail));
  }

  @override
  Future<Either<String, MovieVideosModel>> getVideos({required int id}) {
    final movieVideos = MovieVideosModel(id: 123, results: []);
    return Future.value(Right(movieVideos));
  }
}

void main() {
  group('MovieRepository', () {
    late MovieRepository movieRepository;

    setUp(() {
      movieRepository = MockMovieRepository();
    });

    test('getDiscover returns movie response', () async {
      final result = await movieRepository.getDiscover();
      expect(result.isRight(), true);
    });

    test('getTopRated returns movie response', () async {
      final result = await movieRepository.getTopRated();
      expect(result.isRight(), true);
    });

    test('search returns movie response', () async {
      final result = await movieRepository.search(query: 'example');
      expect(result.isRight(), true);
    });

    test('getDetail returns movie detail', () async {
      final result = await movieRepository.getDetail(id: 1);
      expect(result.isRight(), true);
    });

    test('getVideos returns movie videos', () async {
      final result = await movieRepository.getVideos(id: 1);
      expect(result.isRight(), true);
    });
  });
}
