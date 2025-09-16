import 'package:flutter/material.dart';
import '../../../../../../Core/constants/app_text_styles.dart';

class LeagueNameWidget extends StatelessWidget {
  const LeagueNameWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: AppTextStyles.text12MediumGreenW900,
      ),
    );
  }
}
