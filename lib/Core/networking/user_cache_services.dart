import 'package:hive_ce_flutter/adapters.dart';

import '../models/cache_models.dart';

class UserCacheService {
  UserCacheService({required this.cacheDurationInMinute});
  final int cacheDurationInMinute;
  final cacheBox = Hive.box<UserCacheModel>('users_cache');

  // Save data to Hive with a timestamp
  Future<void> saveToCache(UserCacheModel data) async {
    await cacheBox.put('top_users', data);
  }

  bool isCacheDurationExpired(UserCacheModel cacheData) {
    final timestamp = DateTime.parse(cacheData.timestamp);
    final isExpired = DateTime.now().difference(timestamp).inMinutes >= cacheDurationInMinute;
    return isExpired;
  }

  // Retrieve data from cache if not expired
  UserCacheModel? getFromCache() {
    final cacheData = cacheBox.get('top_users');
    return cacheData;
  }

  Future<void> deleteCache() async {
    await cacheBox.delete('top_users');
  }
}
