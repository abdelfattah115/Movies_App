import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetail extends Equatable {
  final int id;
  final String backdropPath;
  final List<Genres> genres;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  const MovieDetail({
    required this.id,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        genres,
        overview,
        releaseDate,
        runTime,
        title,
        voteAverage,
      ];
}
