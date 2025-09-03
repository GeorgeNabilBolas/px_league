import 'dart:io';

import 'auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HandleAuthExceptions {
  static AuthException _getAuthExceptionMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return const UserNotFoundException();
      case 'wrong-password':
        return const WrongPasswordException();
      case 'email-already-in-use':
        return const EmailAlreadyInUseException();
      case 'weak-password':
        return const WeakPasswordException();
      case 'invalid-email':
        return const InvalidEmailException();
      case 'invalid-credential':
        return const InvalidCredentialException();
      case 'user-disabled':
        return const UserDisabledException();
      case 'too-many-requests':
        return const TooManyRequestsException();
      case 'network-request-failed':
        return const NetworkRequestFailedException();
      case 'channel-error':
        return const CanceledException();
      default:
        return UnexpectedErrorException(e.code);
    }
  }

  static AuthException _getGoogleSignInException(GoogleSignInException e) {
    switch (e.code) {
      case GoogleSignInExceptionCode.canceled:
        return const CanceledException();
      case GoogleSignInExceptionCode.interrupted:
        return const InterruptedException();
      case GoogleSignInExceptionCode.clientConfigurationError:
        return const ClientConfigurationErrorException();
      case GoogleSignInExceptionCode.providerConfigurationError:
        return const ProviderConfigurationErrorException();
      case GoogleSignInExceptionCode.uiUnavailable:
        return const UiUnavailableException();
      case GoogleSignInExceptionCode.userMismatch:
        return const UserMismatchException();
      default:
        return UnexpectedErrorException(e.description ?? 'Unknown error occurred');
    }
  }

  static AuthException getAuthExceptionType(Object error) {
    try {
      switch (error) {
        case SocketException():
          return const NetworkRequestFailedException();
        case FormatException():
          return const FormatException();
        case FirebaseAuthException():
          return _getAuthExceptionMessage(error);
        case GoogleSignInException():
          return _getGoogleSignInException(error);
        default:
          return UnexpectedErrorException(error.toString());
      }
    } on FormatException {
      return const FormatException();
    } catch (e) {
      return UnexpectedErrorException(e.toString());
    }
  }
}
