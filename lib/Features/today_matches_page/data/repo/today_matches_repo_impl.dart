import 'package:px_league/Core/networking/api_services.dart';

import '../../../../Core/errors/api_exceptions/handle_network_exptions.dart';
import '../../../../Core/errors/api_exceptions/network_exptions.dart';
import '../../../../Core/helpers/Internet_handler.dart';
import '../../../../Core/helpers/date_formatter.dart';
import '../../../../Core/models/matches_model.dart';
import '../../../../Core/networking/api_result.dart';
import 'today_matches_repo.dart';

class TodayMatchesRepoImpl implements TodayMatchesRepo {
  TodayMatchesRepoImpl(this._apiService);
  final ApiService _apiService;
  @override
  Future<ApiResult<List<MatchModel>>> getTodayMatches() async {
    try {
      await InternetHandler.isInternetAvailable();
      final response = await _apiService.get(queryParameters: _queryParameters);
      final List<dynamic> allMatchesData = response['response'];
      final List<MatchModel> matchesList = allMatchesData
          .map((match) => MatchModel.fromJson(match))
          .toList();
      return ApiSuccess(matchesList);
    } catch (e) {
      return ApiFailure(HandleNetworkExceptions.getExceptionType(e));
    }
  }

  Map<String, String> get _queryParameters {
    return {
      'date': DateFormatter.formatDateYyyyMmDd(DateTime.now()),
      'timezone': 'Asia/Riyadh',
    };
  }
}
