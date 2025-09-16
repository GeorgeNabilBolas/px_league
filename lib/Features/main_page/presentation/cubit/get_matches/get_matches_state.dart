part of 'get_matches_cubit.dart';

@immutable
sealed class GetMatchesState {
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  });
}

final class GetMatchesInitial extends GetMatchesState {
  GetMatchesInitial();
  @override
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  }) {
    return const _LoadingWidget() as R;
  }
}

final class GetMatchesLoading extends GetMatchesState {
  GetMatchesLoading();
  @override
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  }) {
    return const _LoadingWidget() as R;
  }
}

final class GetMatchesSuccess extends GetMatchesState {
  final List<MatchModel> matches;
  GetMatchesSuccess({required this.matches});
  @override
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  }) {
    return onSuccess(matches);
  }
}

final class GetMatchesFailure extends GetMatchesState {
  final NetworkExceptions error;
  GetMatchesFailure({required this.error});
  @override
  R when<R>({
    required R Function(List<MatchModel> matches) onSuccess,
    required R Function(NetworkExceptions error) onFailure,
  }) {
    return onFailure(error);
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
