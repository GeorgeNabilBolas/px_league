import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../../Core/constants/app_strings.dart';
import '../../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../../Core/di/di.dart';
import '../../../../../data/repo/auth_repo.dart';
import '../../../../cubit/auth/auth_cubit.dart';
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
        create: (context) => AuthCubit(getIt.get<AuthRepo>()),
        child: const ResetPassBottomSheetView(),
      );
    },
  );
}
