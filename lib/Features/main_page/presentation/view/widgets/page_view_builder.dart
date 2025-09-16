import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/constants/app_strings.dart';
import '../../../../../Core/constants/app_text_styles.dart';
import '../../../../../Core/di/di.dart';
import '../../../../today_matches_page/presentation/view/today_matches_page_view.dart';
import '../../../data/repo/main_page_repo.dart';
import '../../cubit/get_matches/get_matches_cubit.dart';

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
          create: (context) => GetMatchesCubit(getIt<MainPageRepo>())..getTodayMatches(),
          child: const TodayMatchesPageView(),
        ),
        Center(
          child: Text(
            AppStrings.leaderboard,
            style: AppTextStyles.text24DarkGreenW700,
          ),
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
