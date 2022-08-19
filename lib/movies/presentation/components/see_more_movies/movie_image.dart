import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/values.dart';

class MovieImageComponent extends StatelessWidget {
  const MovieImageComponent({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FadeInUp(
        from: AppSize.s20,
        duration: const Duration(milliseconds: AppDuration.d500),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p6),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
                Radius.circular(AppSize.s10)),
            child: CachedNetworkImage(
              height: AppSize.s170,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
