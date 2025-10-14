import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/constants/app_strings.dart';
import '../../../../../Core/constants/app_text_styles.dart';
import '../../../../../Core/di/di.dart';
import '../../../../leaderboard_page/data/repo/leaderboard_page_repo.dart';
import '../../../../leaderboard_page/presentation/cubit/leader_board_page_cubit/leader_board_page_cubit_cubit.dart';
import '../../../../leaderboard_page/presentation/view/leaderboard_page_view.dart';
import '../../../../today_matches_page/presentation/view/today_matches_page_view.dart';
import '../../../../today_matches_page/data/repo/today_matches_repo.dart';
import '../../../../today_matches_page/presentation/cubit/today_matches_cubit/today_matches_cubit.dart';

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        BlocProvider(
          create: (context) => TodayMatchesCubit(getIt<TodayMatchesRepo>())..getTodayMatches(),
          child: const TodayMatchesPageView(),
        ),
        BlocProvider(
          create: (context) => LeaderBoardPageCubit(getIt<LeaderboardPageRepo>())..getTopUsers(),
          child: const LeaderboardPageView(),
        ),
        Center(
          child: Text(
            AppStrings.tournaments,
            style: AppTextStyles.text24DarkGreenW700,
          ),
        ),
      ],
    );
  }
}
