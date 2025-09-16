import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/models/matches_model.dart';
import 'match_card/time_and_league_row.dart';
import 'match_card/teams_row.dart';
import '../../../../../Core/constants/app_colors.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match});
  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeAndLeagueRow(
            timeData: match.fixture?.date ?? '',
            leagueData: match.league ?? League(),
          ),
          TeamsRow(teamsData: match.teams ?? Teams()),
        ],
      ),
    );
  }
}
