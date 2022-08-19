import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entity/recommendation.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';
import '../entity/movie.dart';
import '../entity/movie_detail.dart';
import '../../../core/error/failure.dart';
import '../usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      RecommendationParameters parameters);
}
