import 'package:flutter/material.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/constants/app_strings.dart';
import 'widgets/main_page_app_bar.dart';
import 'widgets/page_view_builder.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int _currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainPageAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) async => await _changePage(index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.darkGreen,
        unselectedItemColor: AppColors.mediumGreen,

        items: _pages,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: PageViewBuilder(pageController: _pageController),
      ),
    );
  }

  List<BottomNavigationBarItem> get _pages {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.matchesToday),
      BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: AppStrings.leaderboard),
      BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: AppStrings.tournaments),
    ];
  }

  Future<void> _changePage(int index) async {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}
