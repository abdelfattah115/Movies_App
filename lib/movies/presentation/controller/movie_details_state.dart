part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.movieDetailsMessage = '',

    this.movieRecommendation = const [],
    this.movieRecommendationState = RequestState.loading,
    this.movieRecommendationsMessage = '',
  });

  final MovieDetail? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailsMessage;

  final List<Recommendation> movieRecommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationsMessage;


  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailsMessage,

    List<Recommendation>? movieRecommendation,
    RequestState? movieRecommendationState,
    String? movieRecommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,

      movieRecommendation: movieRecommendation ?? this.movieRecommendation,
      movieRecommendationState: movieRecommendationState ??
          this.movieRecommendationState,
      movieRecommendationsMessage: movieRecommendationsMessage ??
          this.movieRecommendationsMessage,
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetail,
        movieDetailState,
        movieDetailsMessage,
        movieRecommendation,
        movieRecommendationState,
        movieRecommendationsMessage,
      ];
}
