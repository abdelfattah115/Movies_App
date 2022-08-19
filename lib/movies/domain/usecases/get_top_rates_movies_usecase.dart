import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../repository/base_movie_repository.dart';
import '../entity/movie.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase({required this.baseMoviesRepository});


  @override
  Future<Either<Failure, List<Movie>>> call(parameter) async{
   return await baseMoviesRepository.getTopRatedMovies();
  }
}