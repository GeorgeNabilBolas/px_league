import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    required this.backgroundColor,
  });

  final String title;
  final IconData icon;
  final Function()? onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: AppTextStyles.text14WhiteW700),
      leading: Icon(icon, color: AppColors.white),
      tileColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
