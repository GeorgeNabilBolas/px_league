import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_assets.dart';
import '../../../../../../Core/widgets/custom_icon_button.dart';
import '../../../../../../Core/functions/custom_social_auth_func.dart';

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
          onTap: () async => await customSocialAuthFunc(context, SocialAuthType.google),
        ),
        CustomIconButton(
          iconPath: AppAssets.facebookIcon,
          onTap: () async => await customSocialAuthFunc(context, SocialAuthType.facebook),
        ),
      ],
    );
  }
}
