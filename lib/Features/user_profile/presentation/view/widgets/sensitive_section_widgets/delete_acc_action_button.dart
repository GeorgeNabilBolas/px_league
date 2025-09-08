import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../cubit/user_profile/user_profile_cubit.dart';

class DeleteAccountActionButton extends StatelessWidget {
  const DeleteAccountActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileCubit, UserProfileState>(
      listener: (context, state) => context.read<UserProfileCubit>().stateHandler(state, context),
      child: TextButton(
        child: Text(
          style: AppTextStyles.text12MediumGreenW700.copyWith(color: AppColors.boldRed),
          AppStrings.deleteAccount,
        ),
        onPressed: () async => await context.read<UserProfileCubit>().deleteAccount(),
      ),
    );
  }
}
