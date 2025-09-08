import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/di/di.dart';
import '../../../../../../Core/widgets/custom_list_tile.dart';
import '../../../../data/repo/user_profile_repo.dart';
import '../../../cubit/user_profile/user_profile_cubit.dart';
import 'delete_acc_dialog.dart';

class DeleteAccListTile extends StatelessWidget {
  const DeleteAccListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      icon: Icons.delete,
      title: AppStrings.deleteAccount,
      onTap: () => _showDeleteAccDialog(context),
      backgroundColor: AppColors.boldRed,
    );
  }

  void _showDeleteAccDialog(BuildContext context) {
    showAdaptiveDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => UserProfileCubit(getIt<UserProfileRepo>()),
        child: const DeleteAccDialog(),
      ),
    );
  }
}
