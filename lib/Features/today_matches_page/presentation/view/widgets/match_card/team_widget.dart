import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constants/app_text_styles.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({super.key, required this.name, required this.logoUrl});
  final String name;
  final String logoUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.h,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            imageUrl: logoUrl,
            width: 40.w,
            height: 40.h,
            errorWidget: (_, _, _) => const Icon(Icons.sports_soccer),
          ),
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.text14DarkGreenW700,
        ),
      ],
    );
  }
}
