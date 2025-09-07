import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../Core/constants/app_assets.dart';
import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/constants/app_strings.dart';
import '../../../../Core/constants/app_text_styles.dart';
import '../../../../Core/di/di.dart';
import '../../../../Core/routes/app_routes.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import '../../../../Core/widgets/custom_list_tile.dart';
import '../../data/repo/user_profile_repo.dart';
import '../cubit/user_profile/user_profile_cubit.dart';
import 'widgets/profile_section_view.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20.h,
                children: [
                  // Profile section
                  const SizedBox(height: 20),
                  const ProfileSectionView(),
                  // Menu items
                  const CustomListTile(
                    icon: Icons.security,
                    title: AppStrings.privacyPolicy,
                    backgroundColor: AppColors.mediumGreen,
                  ),
                  const CustomListTile(
                    icon: Icons.help_outline,
                    title: AppStrings.termsAndConditions,
                    backgroundColor: AppColors.mediumGreen,
                  ),
                  const CustomListTile(
                    icon: Icons.star_outline,
                    title: AppStrings.rateApp,
                    backgroundColor: AppColors.mediumGreen,
                  ),
                  const CustomListTile(
                    icon: Icons.share,
                    title: AppStrings.shareApp,
                    backgroundColor: AppColors.mediumGreen,
                  ),
                  const Divider(color: AppColors.mediumGreen),
                  // sensitive buttons
                  CustomListTile(
                    icon: Icons.logout,
                    title: AppStrings.logout,
                    onTap: () async {
                      await getIt<FirebaseAuth>().signOut();
                      if (context.mounted) {
                        context.go(AppRoutes.loginRoute);
                      }
                    },
                    backgroundColor: AppColors.boldRed,
                  ),
                  CustomListTile(
                    icon: Icons.delete,
                    title: AppStrings.deleteAccount,
                    onTap: () async {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) => BlocProvider(
                          create: (context) => UserProfileCubit(getIt<UserProfileRepo>()),
                          child: AlertDialog(
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            title: Text(
                              textDirection: TextDirection.rtl,
                              AppStrings.deleteAccountTitle,
                              style: AppTextStyles.text16DarkGreenW700,
                            ),
                            content: Text(
                              textDirection: TextDirection.rtl,
                              AppStrings.deleteAccountAlert,
                              style: AppTextStyles.text14MediumGreenW700,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => context.pop(),
                                child: Text(
                                  AppStrings.cancel,
                                  style: AppTextStyles.text12MediumGreenW700,
                                ),
                              ),

                              Builder(
                                builder: (context) {
                                  return BlocListener<UserProfileCubit, UserProfileState>(
                                    listener: (context, state) {
                                      if (state is UserProfileLoading) {
                                        showAdaptiveDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) => const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }
                                      if (state is UserProfileSuccess) {
                                        context.pop();
                                        context.go(AppRoutes.signupRoute);
                                      } else if (state is UserProfileFailure) {
                                        context.pop();
                                      }
                                    },
                                    child: TextButton(
                                      child: Text(
                                        style: AppTextStyles.text12MediumGreenW700.copyWith(
                                          color: AppColors.boldRed,
                                        ),
                                        AppStrings.deleteAccount,
                                      ),
                                      onPressed: () async {
                                        await context.read<UserProfileCubit>().deleteAccount();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    backgroundColor: AppColors.boldRed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
