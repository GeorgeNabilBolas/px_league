part of 'reset_auth_cubit.dart';

@immutable
sealed class ResetAuthState {
  void handleState(BuildContext context);
}

final class ResetAuthInitial extends ResetAuthState {
  @override
  void handleState(BuildContext context) {
    customLoadingDialog(context);
  }
}

final class ResetAuthLoading extends ResetAuthState {
  @override
  void handleState(BuildContext context) {
    customLoadingDialog(context);
  }
}

final class ResetAuthSuccess extends ResetAuthState {
  @override
  void handleState(BuildContext context) {
    customArSnackBar(context, 'تم ارسال رابط التحقق');
    while (context.canPop()) {
      context.pop();
    }
  }
}

final class ResetAuthFailure extends ResetAuthState {
  ResetAuthFailure(this.exception);
  final AuthException exception;

  @override
  void handleState(BuildContext context) {
    customArSnackBar(context, exception.message);
    while (context.canPop()) {
      context.pop();
    }
  }
}
