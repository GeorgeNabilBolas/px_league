import 'package:flutter/material.dart';
import '../../../../../../Core/models/matches_model.dart';
import 'team_widget.dart';
import '../../../../../../Core/constants/app_text_styles.dart';

class TeamsRow extends StatelessWidget {
  const TeamsRow({super.key, required this.teamsData});
  final Teams teamsData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TeamWidget(name: teamsData.home?.name ?? '', logoUrl: teamsData.home?.logo ?? ''),
        ),
        Expanded(
          child: Text('vs', textAlign: TextAlign.center, style: AppTextStyles.text14DarkGreenW700),
        ),
        Expanded(
          child: TeamWidget(name: teamsData.away?.name ?? '', logoUrl: teamsData.away?.logo ?? ''),
        ),
      ],
    );
  }
}
