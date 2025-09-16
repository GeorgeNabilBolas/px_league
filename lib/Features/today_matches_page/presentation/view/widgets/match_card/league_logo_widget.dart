import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeagueLogoWidget extends StatelessWidget {
  const LeagueLogoWidget({super.key, required this.logoUrl});
  final String logoUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: CachedNetworkImage(
        imageUrl: logoUrl,
        width: 18.w,
        height: 18.h,
        errorWidget: (_, _, _) => const Icon(Icons.sports_soccer),
      ),
    );
  }
}
