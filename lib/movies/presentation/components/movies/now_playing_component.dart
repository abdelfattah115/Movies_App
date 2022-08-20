import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/utils/media_query_values.dart';
import '../../../../core/global/theme/colors/app_color.dart';
import '../../../../core/utils/values.dart';
import '../../../../core/utils/strings.dart';
import '../../screen/movie_detail_screen.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/utils/enums.dart';
import '../../controller/movies_bloc.dart';
import '../../controller/movies_state.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return SizedBox(
              height: context.height,
              child: SpinKitFadingCircle(color: AppColor.lightGrey,),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: AppDuration.d500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: context.height * 0.5,
                  viewportFraction: AppPadding.p1,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MovieDetailScreen(id: item.id),
                        ));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  AppColor.transparent,
                                  AppColor.black,
                                  AppColor.black,
                                  AppColor.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: AppSize.s560,
                              imageUrl:
                                  ApiConstance.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppPadding.p16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: AppColor.redAccent,
                                        size: AppSize.s16,
                                      ),
                                      const SizedBox(
                                        width: AppSize.s4,
                                      ),
                                      Text(
                                        AppString.nowPlaying.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: AppSize.s16,
                                          color: AppColor.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: AppPadding.p16),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: AppSize.s24,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: AppSize.s160,
              child: Center(child: Text(state.nowPlayingMessage)),
            );
        }
      },
    );
  }
}
