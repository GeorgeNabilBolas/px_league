import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../Core/constants/app_assets.dart';
import '../../../../../../Core/constants/app_colors.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.backgroundColor,
  });

  final String? imageUrl;
  final double radius;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? AppColors.mediumGreen,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          height: radius * 1.6,
          width: radius * 1.6,
          fit: BoxFit.cover,
          imageUrl: imageUrl ?? '',

          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => SvgPicture.asset(AppAssets.anonymousIcon),
        ),
      ),
    );
  }
}
