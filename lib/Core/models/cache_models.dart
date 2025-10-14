import 'package:hive_ce_flutter/adapters.dart';

import 'matches_model.dart';
import 'user_model.dart';

class UserCacheModel extends HiveObject {
  UserCacheModel({required this.data, required this.timestamp});
  final List<UserModel> data;
  final String timestamp;
}

class MatchCacheModel extends HiveObject {
  MatchCacheModel({required this.data, required this.timestamp});
  final List<MatchModel> data;
  final String timestamp;
}
