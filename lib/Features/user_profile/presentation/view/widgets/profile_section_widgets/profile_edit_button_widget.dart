import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../cubit/user_profile/user_profile_cubit.dart';
import 'profile_edit_dialog.dart';

class ProfileEditButtonWidget extends StatelessWidget {
  const ProfileEditButtonWidget({
    super.key,
    required this.cubit,
  });
  final UserProfileCubit cubit;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        foregroundColor: const WidgetStatePropertyAll(AppColors.white),
        backgroundColor: const WidgetStatePropertyAll(AppColors.mediumGreen),
      ),
      label: const Text(AppStrings.edit),
      icon: const Icon(Icons.edit),
      onPressed: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => BlocProvider<UserProfileCubit>.value(
            value: cubit,
            child: const Directionality(
              textDirection: TextDirection.rtl,
              child: ProfileEditDialog(),
            ),
          ),
        );
      },
    );
  }
}
