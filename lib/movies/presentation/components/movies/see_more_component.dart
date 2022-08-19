import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/utils/media_query_values.dart';
import 'package:movies/core/utils/strings.dart';

import '../../../../core/global/theme/colors/app_color.dart';
import '../../../../core/utils/values.dart';

class SeeMoreComponent extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const SeeMoreComponent({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.05,
      margin: const EdgeInsets.fromLTRB(
          AppMargin.m16, AppMargin.m10, AppMargin.m16, AppMargin.m8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: AppSize.s20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: AppColor.white,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                children: const [
                  Text(
                    AppString.seeMore,
                    style: TextStyle(color: AppColor.white),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: AppSize.s16,
                    color: AppColor.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
