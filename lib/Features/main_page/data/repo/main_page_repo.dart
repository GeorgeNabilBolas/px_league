import '../../../../Core/networking/api_result.dart';
import '../../../../Core/models/matches_model.dart';

abstract class MainPageRepo {
  Future<ApiResult<List<MatchModel>>> getTodayMatches();
}
