part of 'leader_board_page_cubit_cubit.dart';

@immutable
sealed class LeaderBoardPageCubitState extends Equatable {
  const LeaderBoardPageCubitState();

  @override
  List<Object?> get props => [];

  R when<R>({
    required R Function(List<UserModel> users) onSuccess,
    required R Function(String message) onError,
  });
}

final class LeaderBoardPageCubitInitial extends LeaderBoardPageCubitState {
  @override
  R when<R>({
    required R Function(List<UserModel> users) onSuccess,
    required R Function(String message) onError,
  }) {
    return const CustomLoadingWidget() as R;
  }
}

final class LeaderBoardPageCubitLoading extends LeaderBoardPageCubitState {
  @override
  R when<R>({
    required R Function(List<UserModel> users) onSuccess,
    required R Function(String message) onError,
  }) {
    return const CustomLoadingWidget() as R;
  }
}

final class LeaderBoardPageCubitSuccess extends LeaderBoardPageCubitState {
  const LeaderBoardPageCubitSuccess({required this.users});
  final List<UserModel> users;
  @override
  R when<R>({
    required R Function(List<UserModel> users) onSuccess,
    required R Function(String message) onError,
  }) {
    return onSuccess(users);
  }

  @override
  List<Object?> get props => [users];
}

final class LeaderBoardPageCubitError extends LeaderBoardPageCubitState {
  const LeaderBoardPageCubitError({required this.message});
  final String message;
  @override
  R when<R>({
    required R Function(List<UserModel> users) onSuccess,
    required R Function(String message) onError,
  }) {
    return onError(message);
  }

  @override
  List<Object?> get props => [message];
}
