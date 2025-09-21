// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'match_card.dart';
import '../../../../../Core/models/matches_model.dart';
import 'today_matches_page_top_bar.dart';

class TodayMatchesSuccessWidget extends StatelessWidget {
  const TodayMatchesSuccessWidget({
    super.key,
    required this.matches,
  });

  final List<MatchModel> matches;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: TodayMatchesPageTopBar()),
        SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        SliverList.separated(
          separatorBuilder: (_, _) => SizedBox(height: 20.h),
          itemCount: matches.length,
          itemBuilder: (context, index) => MatchCard(match: matches[index]),
        ),
      ],
    );
  }
}
