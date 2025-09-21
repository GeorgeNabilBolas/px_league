part of 'today_matches_cubit.dart';

@immutable
sealed class TodayMatchesState extends Equatable {
  const TodayMatchesState();

  @override
  List<Object?> get props => [];

  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  });
}

final class TodayMatchesInitial extends TodayMatchesState {
  const TodayMatchesInitial();
  @override
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  }) {
    return const CustomLoadingWidget() as R;
  }
}

final class TodayMatchesLoading extends TodayMatchesState {
  const TodayMatchesLoading();
  @override
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  }) {
    return const CustomLoadingWidget() as R;
  }
}

final class TodayMatchesSuccess extends TodayMatchesState {
  const TodayMatchesSuccess({required this.matches});
  final List<MatchModel> matches;
  @override
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  }) {
    return onSuccess(matches);
  }

  @override
  List<Object?> get props => [matches];
}

final class TodayMatchesFailure extends TodayMatchesState {
  const TodayMatchesFailure({required this.error});
  final NetworkExceptions error;
  @override
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  }) {
    return onFailure(error);
  }

  @override
  List<Object?> get props => [error];
}
