import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/core/utils/enums.dart';

import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rates_movies_usecase.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import 'movies_events.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatesMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold(
              (failure) => emit(
            state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: failure.message,
            ),
          ),
              (movies) => emit(
            state.copyWith(
              nowPlayingMovies: movies,
              nowPlayingState: RequestState.loaded,
            ),
          ));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (failure) => emit(
          state.copyWith(
              popularState: RequestState.error,
              popularMessage: failure.message),
        ),
            (movies) => emit(state.copyWith(
          popularMovies: movies,
          popularState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatesMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
            (failure) => emit(state.copyWith(
            popularState: RequestState.error,
            popularMessage: failure.message)),
            (movies) => emit(state.copyWith(
          topRatedMovies: movies,
          topRatedState: RequestState.loaded,
        )));
  }
}
