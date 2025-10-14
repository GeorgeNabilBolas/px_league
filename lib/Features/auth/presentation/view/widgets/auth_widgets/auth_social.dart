// import 'package:flutter/material.dart';

// import '../../../../../../Core/constants/app_assets.dart';
// import '../../../../../../Core/models/auth_modal.dart';
// import '../../../../../../Core/widgets/custom_icon_button.dart';
// import '../../../../../../Core/helpers/custom_auth_handler.dart';

// class AuthSocial extends StatelessWidget {
//   const AuthSocial({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         CustomIconButton(
//           iconPath: AppAssets.googleIcon,
//           onTap: () => customAuthHandler(
//             context,
//             authModal: const AuthModal(type: SocialAuthType.google),
//           ),
//         ),
//         CustomIconButton(
//           iconPath: AppAssets.facebookIcon,
//           onTap: () => customAuthHandler(
//             context,
//             authModal: const AuthModal(type: SocialAuthType.facebook),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_assets.dart';
import '../../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../../Core/helpers/custom_loading_dialog.dart';
import '../../../../../../Core/routes/app_routes.dart';
import '../../../../../../Core/widgets/custom_icon_button.dart';
import '../../../cubit/auth_cubit/auth_cubit.dart';

class AuthSocial extends StatelessWidget {
  const AuthSocial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomIconButton(
          iconPath: AppAssets.googleIcon,
          onTap: () async => await context.read<AuthCubit>().signInWithGoogle(),
        ),
        CustomIconButton(
          iconPath: AppAssets.facebookIcon,
          onTap: () async => await context.read<AuthCubit>().signInWithFacebook(),
        ),
      ],
    );
  }
}
