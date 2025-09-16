import '../../../../Core/networking/auth_result.dart';

abstract class UserProfileRepo {
  Future<AuthResult<void>> deleteUser();
  Future<AuthResult<void>> signOutUser();
  Future<AuthResult<void>> updateUserDisplayName({String? displayName});
}
