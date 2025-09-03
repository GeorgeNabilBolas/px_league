import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../Core/constants/app_colors.dart';
import '../../../../../../../Core/constants/app_strings.dart';
import '../../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../../Core/errors/firebase_exceptions/handle_auth_exceptions.dart';
import '../../../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../../../Core/widgets/custom_button.dart';
import '../auth_email_text_field.dart';
import 'reset_pass_bottom_sheet_body.dart';

class ResetPassBottomSheetView extends StatelessWidget {
  const ResetPassBottomSheetView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const ResetPassBottomSheetBody(),
          ),
        ),
      ),
    );
  }
}
