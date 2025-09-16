import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/models/matches_model.dart';
import 'league_logo_widget.dart';
import 'league_name_widget.dart';
import 'match_time_widget.dart';

class TimeAndLeagueRow extends StatelessWidget {
  const TimeAndLeagueRow({
    super.key,
    required this.timeData,
    required this.leagueData,
  });

  final String timeData;
  final League leagueData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            spacing: 4.w,
            children: [
              LeagueLogoWidget(logoUrl: leagueData.logo ?? ''),
              LeagueNameWidget(name: leagueData.name ?? ''),
            ],
          ),
        ),
        MatchTimeWidget(time: timeData),
      ],
    );
  }
}
