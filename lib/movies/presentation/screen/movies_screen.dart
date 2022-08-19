import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/strings.dart';
import 'package:movies/core/utils/values.dart';

import 'popular_movies_screen.dart';
import 'top_rated_movies_screen.dart';
import '../components/movies/see_more_component.dart';
import '../components/movies/top_rates_component.dart';
import '../components/movies/now_playing_component.dart';
import '../controller/movies_events.dart';
import '../../../core/services/service_locator.dart';
import '../components/movies/popular_component.dart';
import '../controller/movies_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatesMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              SeeMoreComponent(
                  title: AppString.popular,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PopularMoviesScreen(),
                        ));
                  }),
              const PopularComponent(),
              SeeMoreComponent(
                  title: AppString.topRated,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TopRatedMoviesScreen(),
                      ),
                    );
                  }),
              const TopRatedComponent(),
              const SizedBox(height: AppSize.s50),
            ],
          ),
        ),
      ),
    );
  }
}
