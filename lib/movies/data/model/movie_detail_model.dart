import 'genres_model.dart';
import '../../domain/entity/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.id,
    required super.backdropPath,
    required super.genres,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(
          json['genres'].map((e) => GenresModel.fromJson(e))),
      overview: json['overview'],
      releaseDate: json['release_date'],
      runTime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
