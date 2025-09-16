import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import 'widgets/menu_section_view.dart';
import 'widgets/profile_section_view.dart';
import 'widgets/sensitive_section_view.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                spacing: 20.h,
                children: const [
                  ProfileSectionView(),
                  MenuSectionView(),
                  Divider(color: AppColors.mediumGreen),
                  SensitiveSectionView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
