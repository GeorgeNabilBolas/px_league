import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_colors.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.darkGreen : AppColors.lightGreen,
      ),
    );
  }
}
