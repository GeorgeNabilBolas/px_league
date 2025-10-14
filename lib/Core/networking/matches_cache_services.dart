import 'package:hive_ce_flutter/adapters.dart';

import '../models/cache_models.dart';

class MatchesCacheService {
  MatchesCacheService({required this.cacheDurationInMinute});
  final int cacheDurationInMinute;
  final cacheBox = Hive.box<MatchCacheModel>('matches_cache');

  // Save data to Hive with a timestamp
  Future<void> saveToCache(MatchCacheModel data) async {
    await cacheBox.put('matches', data);
  }

  bool isCacheDurationExpired(MatchCacheModel cacheData) {
    final timestamp = DateTime.parse(cacheData.timestamp);
    final isExpired = DateTime.now().difference(timestamp).inMinutes >= cacheDurationInMinute;
    return isExpired;
  }

  // Retrieve data from cache if not expired
  MatchCacheModel? getFromCache() {
    final cacheData = cacheBox.get('matches');
    return cacheData;
  }

  Future<void> deleteCache() async {
    await cacheBox.delete('matches');
  }
}
