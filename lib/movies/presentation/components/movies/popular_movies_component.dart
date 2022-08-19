import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/global/theme/colors/app_color.dart';
import 'package:movies/core/utils/strings.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/utils/enums.dart';
import '../../controller/movies_bloc.dart';
import '../../controller/movies_state.dart';

class PopularMoviesContent extends StatelessWidget {
  const PopularMoviesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return Center(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.lightGrey,
                ),
              ),
            );
          case RequestState.loaded:
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(AppString.popularMovies),
                    titlePadding: EdgeInsets.all(20),
                  ),
                  elevation: 0.0,
                  floating: true,
                  pinned: true,
                  expandedHeight: 100,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final movie = state.popularMovies[index];
                      return Container(
                        padding: const EdgeInsets.all(5),
                        width: double.infinity,
                        height: 180,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide.none,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: FadeInUp(
                                  from: 20,
                                  duration: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      child: CachedNetworkImage(
                                        height: 170.0,
                                        imageUrl: ApiConstance.imageUrl(
                                            movie.backdropPath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: FadeInUp(
                                  from: 20,
                                  duration: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(movie.title,
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              letterSpacing: 0.9,
                                            )),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                vertical: 2.0,
                                                horizontal: 8.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                borderRadius:
                                                BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                movie.releaseDate.split('-')[0],
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 20.0,
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  (movie.voteAverage / 2)
                                                      .toStringAsFixed(1),
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  '(${movie.voteAverage})',
                                                  style: const TextStyle(
                                                    fontSize: 1.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20.0),
                                        Text(
                                          movie.overview,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1.2,
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: state.popularMovies.length,
                  ),
                ),
              ],
            );
          case RequestState.error:
            return Center(
              child: Text(state.popularMessage),
            );
        }
      },
    );
  }
}
