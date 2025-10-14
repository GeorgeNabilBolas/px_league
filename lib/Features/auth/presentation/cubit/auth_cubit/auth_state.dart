part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  void handleState(BuildContext context);
}

final class AuthInitial extends AuthState {
  @override
  void handleState(BuildContext context) {
    customLoadingDialog(context);
  }
}

final class AuthLoading extends AuthState {
  @override
  void handleState(BuildContext context) {
    customLoadingDialog(context);
  }
}

final class AuthSuccess extends AuthState {
  @override
  void handleState(BuildContext context) {
    context.go(AppRoutes.mainPageRoute);
  }
}

final class AuthFailure extends AuthState {
  AuthFailure(this.exception);
  final AuthException exception;

  @override
  void handleState(BuildContext context) {
    customArSnackBar(context, exception.message);
    while (context.canPop()) {
      context.pop();
    }
  }
}
