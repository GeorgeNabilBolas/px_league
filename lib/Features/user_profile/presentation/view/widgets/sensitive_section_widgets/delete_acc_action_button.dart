import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../../Core/helpers/custom_loading_dialog.dart';
import '../../../../../../Core/routes/app_routes.dart';
import '../../../cubit/user_profile/user_profile_cubit.dart';
import '../../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';

class DeleteAccountActionButton extends StatelessWidget {
  const DeleteAccountActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        state.when(
          onLoading: () async => await customLoadingDialog(context),
          onSuccess: () => _popToSignupFunc(context),
          onFailure: (exception) => _popAndShowExceptionFunc(context, exception),
        );
      },
      child: TextButton(
        child: Text(
          style: AppTextStyles.text12MediumGreenW700.copyWith(color: AppColors.boldRed),
          AppStrings.deleteAccount,
        ),
        onPressed: () async => await context.read<UserProfileCubit>().deleteAccount(),
      ),
    );
  }

  void _popAndShowExceptionFunc(BuildContext context, AuthException exception) {
    context.pop();
    customArSnackBar(context, exception.message);
  }

  void _popToSignupFunc(BuildContext context) {
    while (context.canPop()) {
      context.pop();
    }
    context.go(AppRoutes.signupRoute);
  }
}
