import '../../../../Core/networking/api_result.dart';
import '../../../../Core/models/matches_model.dart';

abstract class TodayMatchesRepo {
  Future<ApiResult<List<MatchModel>>> getTodayMatches();
}
