import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../Core/constants/app_strings.dart';
import '../../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../../Core/di/di.dart';
import '../../../../../data/repo/auth_repo.dart';
import '../../../../cubit/auth_cubit/auth_cubit.dart';
import '../../../../cubit/reset_auth_cubit/reset_auth_cubit.dart';
import 'reset_pass_bottom_sheet.dart';

class AuthResetPass extends StatelessWidget {
  const AuthResetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () async {
          await showResetPassModalSheet(context);
        },
        child: Text(
          textDirection: TextDirection.rtl,
          AppStrings.forgotPasswordTitle,
          style: AppTextStyles.text12MediumGreenW900,
        ),
      ),
    );
  }
}

Future<void> showResetPassModalSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => ResetAuthCubit(getIt.get<AuthRepo>()),
        child: const ResetPassBottomSheetView(),
      );
    },
  );
}
