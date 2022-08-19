import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/global/theme/colors/app_color.dart';
import '../../../../core/utils/values.dart';

class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({Key? key, required this.movieTitle, required this.releaseDate, required this.voteAverage, required this.overview}) : super(key: key);

  final String movieTitle;
  final String releaseDate;
  final String voteAverage;
  final String overview;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppSize.s2,
      child: FadeInUp(
        from: AppSize.s20,
        duration: const Duration(milliseconds: AppDuration.d500),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8,vertical: AppPadding.p20,),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(movieTitle,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: AppSize.s18,
                      fontWeight: FontWeight.w600,
                    ),
                    letterSpacing: AppSize.s1,
                  )),
              const SizedBox(height: AppSize.s8),
              Row(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      vertical: AppPadding.p2,
                      horizontal: AppPadding.p8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.redAccent,
                      borderRadius:
                      BorderRadius.circular(AppSize.s4),
                    ),
                    child: Text(
                      releaseDate.split('-')[0],
                      style: const TextStyle(
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.s16),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColor.amber,
                        size: AppSize.s20,
                      ),
                      const SizedBox(width: AppSize.s4),
                      Text(
                        voteAverage,
                        style: const TextStyle(
                          fontSize: AppSize.s16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: AppSize.s1_2,
                        ),
                      ),
                      const SizedBox(width: AppSize.s4),
                      Text(
                        '($voteAverage)',
                        style: const TextStyle(
                          fontSize: AppSize.s1,
                          fontWeight: FontWeight.w500,
                          letterSpacing: AppSize.s1_2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              Text(
                overview,
                maxLines: AppSize.s2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppSize.s1_2,
                  height: AppSize.s1_5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
