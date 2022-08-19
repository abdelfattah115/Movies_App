import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_use_case.dart';

import '../../../core/error/failure.dart';
import '../repository/base_movie_repository.dart';
import '../entity/movie.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(parameter) async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}