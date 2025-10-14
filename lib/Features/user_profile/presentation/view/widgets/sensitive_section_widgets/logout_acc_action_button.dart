import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/di/di.dart';
import '../../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../../Core/helpers/custom_loading_dialog.dart';
import '../../../../../../Core/routes/app_routes.dart';
import '../../../../../../Core/widgets/custom_list_tile.dart';
import '../../../../data/repo/user_profile_repo.dart';
import '../../../cubit/user_profile/user_profile_cubit.dart';
import '../../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';

class LogoutAccListTile extends StatelessWidget {
  const LogoutAccListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit(getIt<UserProfileRepo>()),
      child: Builder(
        builder: (context) {
          return BlocListener<UserProfileCubit, UserProfileState>(
            listener: (context, state) {
              state.when(
                onLoading: () async => await customLoadingDialog(context),
                onSuccess: () => _popToLoginFunc(context),
                onFailure: (exception) => _popAndShowExceptionFunc(context, exception),
              );
            },
            child: CustomListTile(
              icon: Icons.logout,
              title: AppStrings.logout,
              onTap: () async => await context.read<UserProfileCubit>().signOutUser(),
              backgroundColor: AppColors.boldRed,
            ),
          );
        },
      ),
    );
  }

  void _popAndShowExceptionFunc(BuildContext context, AuthException exception) {
    context.pop();
    customArSnackBar(context, exception.message);
  }

  void _popToLoginFunc(BuildContext context) {
    while (context.canPop()) {
      context.pop();
    }
    context.go(AppRoutes.loginRoute);
  }
}
