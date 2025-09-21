import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/di/di.dart';
import '../../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
import '../../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../../Core/helpers/custom_loading_dialog.dart';
import '../../../../../../Core/routes/app_routes.dart';
import '../../../../../../Core/widgets/custom_profile_image.dart';
import '../../../cubit/user_profile/user_profile_cubit.dart';

class ProfileEditDialog extends StatefulWidget {
  const ProfileEditDialog({
    super.key,
  });

  @override
  State<ProfileEditDialog> createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  late TextEditingController _nameController;
  @override
  void initState() {
    _nameController = TextEditingController();
    _nameController.text = getIt<FirebaseAuth>().currentUser!.displayName ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: Text(
        textAlign: TextAlign.center,
        AppStrings.editProfileTitle,
        style: AppTextStyles.text16DarkGreenW700,
      ),
      content: Column(
        spacing: 20.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomProfileImage(
            imageUrl: getIt<FirebaseAuth>().currentUser!.photoURL ?? '',
            radius: 35.r,
          ),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: AppStrings.name,
              hintText: _nameController.text,
              labelStyle: AppTextStyles.text14MediumGreenW700,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            _nameController.clear();
            context.pop();
          },
          child: Text(
            AppStrings.cancel,
            style: AppTextStyles.text14MediumGreenW700,
          ),
        ),
        BlocListener<UserProfileCubit, UserProfileState>(
          listener: (context, state) {
            state.when(
              onLoading: () async => await customLoadingDialog(context),
              onSuccess: () => _popToUserProfileFunc(context),
              onFailure: (exception) => _popAndShowExceptionFunc(context, exception),
            );
          },
          child: TextButton(
            onPressed: () async {
              await context.read<UserProfileCubit>().updateProfile(
                displayName: _nameController.text,
              );
            },
            child: Text(
              AppStrings.edit,
              style: AppTextStyles.text14DarkGreenW700,
            ),
          ),
        ),
      ],
    );
  }

  void _popToUserProfileFunc(BuildContext context) {
    Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.userProfileRoute);
    customArSnackBar(context, 'تم تحديث الملف الشخصي');
  }

  void _popAndShowExceptionFunc(BuildContext context, AuthException exception) {
    Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.userProfileRoute);
    customArSnackBar(context, exception.message);
  }
}
