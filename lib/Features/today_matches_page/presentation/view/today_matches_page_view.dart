import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/di/di.dart';
import '../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../Core/networking/matches_cache_services.dart';
import '../../../../Core/widgets/custom_error_widget.dart';
import '../cubit/today_matches_cubit/today_matches_cubit.dart';
import 'widgets/today_matches_success_widget.dart';

class TodayMatchesPageView extends StatelessWidget {
  const TodayMatchesPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayMatchesCubit, TodayMatchesState>(
      builder: (context, state) {
        return state.when(
          onSuccess: (matches) => TodayMatchesSuccessWidget(matches: matches),
          onFailure: (error) {
            final cachedData = getIt<MatchesCacheService>().getFromCache();
            if (cachedData != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                customArSnackBar(context, error.message);
              });
              return TodayMatchesSuccessWidget(matches: cachedData.data);
            }
            return CustomErrorWidget(
              message: error.message,
              onPressed: () => context.read<TodayMatchesCubit>().getTodayMatches(),
            );
          },
        );
      },
    );
  }
}
