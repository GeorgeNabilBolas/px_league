import 'package:flutter/material.dart';

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
