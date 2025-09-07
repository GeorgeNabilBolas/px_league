import '../../../../Core/networking/auth_result.dart';

abstract class UserProfileRepo {
  Future<AuthResult<void>> deleteAccount();
}
