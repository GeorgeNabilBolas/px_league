import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/di/di.dart';
import '../../../../../../Core/routes/app_routes.dart';
import '../../../../../../Core/widgets/custom_list_tile.dart';

class LogoutAccListTile extends StatelessWidget {
  const LogoutAccListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      icon: Icons.logout,
      title: AppStrings.logout,
      onTap: () async => await _logoutAndPop(context),
      backgroundColor: AppColors.boldRed,
    );
  }

  Future<void> _logoutAndPop(BuildContext context) async {
    await getIt<FirebaseAuth>().signOut();
    if (context.mounted) context.go(AppRoutes.loginRoute);
  }
}
