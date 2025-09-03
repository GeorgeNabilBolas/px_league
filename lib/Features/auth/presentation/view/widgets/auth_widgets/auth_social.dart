import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_assets.dart';
import '../../../../../../Core/widgets/custom_icon_button.dart';
import '../../../../../../Core/helpers/custom_auth_handler.dart';

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
          onTap: () async => await customAuthHandler(context, type: SocialAuthType.google),
        ),
        CustomIconButton(
          iconPath: AppAssets.facebookIcon,
          onTap: () async => await customAuthHandler(context, type: SocialAuthType.facebook),
        ),
      ],
    );
  }
}
