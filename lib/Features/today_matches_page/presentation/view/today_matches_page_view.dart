import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/widgets/custom_error_widget.dart';
import '../cubit/today_matches_cubit/today_matches_cubit.dart';
import 'widgets/today_matches_success_widget.dart';

class TodayMatchesPageView extends StatefulWidget {
  const TodayMatchesPageView({
    super.key,
  });

  @override
  State<TodayMatchesPageView> createState() => _TodayMatchesPageViewState();
}

class _TodayMatchesPageViewState extends State<TodayMatchesPageView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TodayMatchesCubit, TodayMatchesState>(
      builder: (context, state) {
        return state.when(
          onSuccess: (matches) => TodayMatchesSuccessWidget(matches: matches),
          onFailure: (error) => CustomErrorWidget(
            message: error.message,
            onPressed: () => context.read<TodayMatchesCubit>().getTodayMatches(),
          ),
        );
      },
    );
  }
}
