part of 'user_profile_cubit.dart';

@immutable
sealed class UserProfileState {
  void when({
    required Function() onSuccess,
    required Function(AuthException exception) onFailure,
    required Function() onLoading,
  });
}

final class UserProfileInitial extends UserProfileState {
  @override
  void when({
    required Function() onSuccess,
    required Function(AuthException exception) onFailure,
    required Function() onLoading,
  }) {
    onLoading();
  }
}

final class UserProfileLoading extends UserProfileState {
  @override
  void when({
    required Function() onSuccess,
    required Function(AuthException exception) onFailure,
    required Function() onLoading,
  }) {
    onLoading();
  }
}

final class UserProfileSuccess extends UserProfileState {
  UserProfileSuccess();

  @override
  void when({
    required Function() onSuccess,
    required Function(AuthException exception) onFailure,
    required Function() onLoading,
  }) {
    onSuccess();
  }
}

final class UserProfileFailure extends UserProfileState {
  UserProfileFailure(this.exception);
  final AuthException exception;

  @override
  void when({
    required Function() onSuccess,
    required Function(AuthException exception) onFailure,
    required Function() onLoading,
  }) {
    onFailure(exception);
  }
}
