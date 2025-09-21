import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/constants/app_strings.dart';
import '../../../../Core/constants/app_text_styles.dart';
import '../../../../Core/models/user_model.dart';
import '../../../../Core/widgets/custom_error_widget.dart';
import '../../../../Core/widgets/custom_profile_image.dart';
import '../../data/repo/leaderboard_page_repo_impl.dart';
import '../cubit/leader_board_page_cubit/leader_board_page_cubit_cubit.dart';

class LeaderboardPageView extends StatelessWidget {
  const LeaderboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LeaderBoardPageCubit(LeaderboardPageRepoImpl())..getTopUsers(),
        child: const Directionality(
          textDirection: TextDirection.rtl,
          child: LeaderBoardPageBody(),
        ),
      ),
    );
  }
}

class LeaderBoardPageBody extends StatelessWidget {
  const LeaderBoardPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaderBoardPageCubit, LeaderBoardPageCubitState>(
      builder: (context, state) {
        return state.when(
          onSuccess: (users) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ---------- Top Leaders ----------
                TopLeadersWidget(topUsers: users),
                const SizedBox(height: 24),

                // ---------- All Leaders ----------
                Text(
                  'جميع المتصدرين',
                  style: AppTextStyles.text14DarkGreenW700,
                ),
                const SizedBox(height: 12),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return LeaderItem(
                      rank: index + 1,
                      name: users[index].displayName ?? 'Annonymos User',
                      points: users[index].totalPoints.toString(),
                      color: _getColorByRank(index + 1),
                    );
                  },
                ),
              ],
            ),
          ),
          onError: (message) => CustomErrorWidget(
            message: message,
            onPressed: () {
              context.read<LeaderBoardPageCubit>().getTopUsers();
            },
          ),
        );
      },
    );
  }
}

class TopLeadersWidget extends StatelessWidget {
  const TopLeadersWidget({
    super.key,
    required this.topUsers,
  });
  final List<UserModel> topUsers;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5E6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 20.h,
        children: [
          topLeaderTitle(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TopLeadersViewWidget(
                  placeBackgroundColor: AppColors.darkSilver,
                  imageBackgroundColor: AppColors.mediumSilver,
                  user: topUsers[1],
                  place: 'الثاني',
                  size: 30,
                ),
              ),
              Expanded(
                child: TopLeadersViewWidget(
                  placeBackgroundColor: AppColors.darkGold,
                  imageBackgroundColor: AppColors.mediumGold,
                  user: topUsers[0],
                  place: 'الأول',

                  size: 40,
                ),
              ),
              Expanded(
                child: TopLeadersViewWidget(
                  placeBackgroundColor: AppColors.darkBronze,
                  imageBackgroundColor: AppColors.mediumBronze,
                  user: topUsers[2],
                  place: 'الثالث',

                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopLeadersViewWidget extends StatelessWidget {
  const TopLeadersViewWidget({
    super.key,
    required this.place,
    required this.size,
    required this.user,
    required this.imageBackgroundColor,
    required this.placeBackgroundColor,
  });
  final String place;
  final double size;
  final UserModel user;
  final Color imageBackgroundColor;
  final Color placeBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileImage(
          imageUrl: user.photoURL,
          radius: size,
          backgroundColor: imageBackgroundColor,
        ),
        SizedBox(height: 6.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: placeBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            place,
            style: AppTextStyles.text14WhiteW700,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          maxLines: 1,
          user.displayName ?? 'Annonymos User',
          style: AppTextStyles.text12DarkGreenW700,
        ),
        Text(
          user.totalPoints.toString(),
          style: AppTextStyles.text12DarkGreenW400,
        ),
      ],
    );
  }
}

class topLeaderTitle extends StatelessWidget {
  const topLeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.darkGold,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        style: AppTextStyles.text14WhiteW700,
        AppStrings.topLeaders,
        textAlign: TextAlign.center,
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////
Color _getColorByRank(int rank) {
  switch (rank) {
    case 1:
      return const Color(0xFFFFC107); // gold
    case 2:
      return Colors.grey;
    case 3:
      return const Color(0xFFFF9800); // orange
    default:
      return const Color(0xFFB2DFDB); // teal light
  }
}

class LeaderItem extends StatelessWidget {
  final int rank;
  final String name;
  final String points;
  final Color color;

  const LeaderItem({
    super.key,
    required this.rank,
    required this.name,
    required this.points,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black12.withOpacity(0.05),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: color,
            child: Text(
              rank.toString(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.person, size: 28, color: Colors.teal),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(points, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
