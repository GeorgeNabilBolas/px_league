import '../../../../Core/models/user_model.dart';
import '../../../../Core/networking/api_result.dart';

abstract class LeaderboardPageRepo {
  Future<ApiResult<List<UserModel>>> getTopUsers();
}
