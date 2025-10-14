
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../Core/errors/api_exceptions/handle_network_exptions.dart';
import '../../../../Core/errors/api_exceptions/network_exptions.dart';
import '../../../../Core/helpers/Internet_handler.dart';
import '../../../../Core/models/cache_models.dart';
import '../../../../Core/models/user_model.dart';
import '../../../../Core/networking/api_result.dart';
import '../../../../Core/networking/user_cache_services.dart';
import 'leaderboard_page_repo.dart';

class LeaderboardPageRepoImpl implements LeaderboardPageRepo {
  LeaderboardPageRepoImpl(this._cacheService);
  final UserCacheService _cacheService;
  @override
  Future<ApiResult<List<UserModel>>> getTopUsers() async {
    final cachedData = _cacheService.getFromCache();
    if (cachedData != null) {
      if (_cacheService.isCacheDurationExpired(cachedData)) {
        if (!await InternetHandler.isConnected) {
          return ApiFailure(const NoInternetConnectionException());
        }
        await _cacheService.deleteCache();
      } else {
        return ApiSuccess(cachedData.data);
      }
    }
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('totalPoints', descending: true)
          .get();
      final users = querySnapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
      await _cacheService.saveToCache(
        UserCacheModel(data: users, timestamp: DateTime.now().toIso8601String()),
      );
      return ApiSuccess(users);
    } on Exception catch (e) {
      return ApiFailure(
        HandleNetworkExceptions.getExceptionType(e),
      );
    }
  }
}
