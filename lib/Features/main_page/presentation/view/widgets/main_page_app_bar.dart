import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../../../../../Core/constants/app_text_styles.dart';
import '../../../../../Core/routes/app_routes.dart';
import '../../../../../Core/widgets/custom_app_logo.dart';
import '../../../../../Core/widgets/custom_profile_image.dart';

class MainPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppLogo(
              textStyle: AppTextStyles.text26DarkGreenW700,
              logoSize: 40,
            ),
            IconButton(
              style: IconButton.styleFrom(padding: EdgeInsets.zero),
              icon: CustomProfileImage(
                radius: kToolbarHeight * .4,

                imageUrl: FirebaseAuth.instance.currentUser?.photoURL,
              ),
              onPressed: () => context.push(AppRoutes.userProfileRoute),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
