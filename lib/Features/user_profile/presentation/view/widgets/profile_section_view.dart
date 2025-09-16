import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constants/app_colors.dart';
import '../../../../../Core/di/di.dart';
import '../../../data/repo/user_profile_repo.dart';
import '../../cubit/user_profile/user_profile_cubit.dart';
import 'profile_section_widgets/profile_edit_button_widget.dart';
import 'profile_section_widgets/profile_statistics_widget.dart';
import 'profile_section_widgets/profile_user_data_widget.dart';

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit(getIt<UserProfileRepo>()),

      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          spacing: 20.h,
          children: [
            const ProfileUserDataWidget(),
            const ProfileStatisticsWidget(),
            Builder(
              builder: (context) {
                return ProfileEditButtonWidget(cubit: context.read<UserProfileCubit>());
              },
            ),
          ],
        ),
      ),
    );
  }
}
