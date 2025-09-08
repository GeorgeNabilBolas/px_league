import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../Core/constants/app_assets.dart';
import '../../../../../../Core/di/di.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35.r,
      backgroundColor: const Color(0xFF7DB8A3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          height: MediaQuery.sizeOf(context).width * 0.15,
          width: MediaQuery.sizeOf(context).width * 0.15,
          fit: BoxFit.cover,
          imageUrl: getIt<FirebaseAuth>().currentUser!.photoURL!,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => SvgPicture.asset(AppAssets.anonymousIcon),
        ),
      ),
    );
  }
}
