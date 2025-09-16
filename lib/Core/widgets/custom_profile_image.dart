import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../Core/constants/app_assets.dart';
import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/di/di.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 35.r,
      backgroundColor: AppColors.mediumGreen,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          height: height ?? MediaQuery.sizeOf(context).width * 0.15,
          width: width ?? MediaQuery.sizeOf(context).width * 0.15,
          fit: BoxFit.cover,
          imageUrl: imageUrl ?? '',

          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => SvgPicture.asset(AppAssets.anonymousIcon),
        ),
      ),
    );
  }
}
