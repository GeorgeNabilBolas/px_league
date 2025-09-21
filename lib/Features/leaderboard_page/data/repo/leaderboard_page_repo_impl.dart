import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../Core/errors/api_exceptions/handle_network_exptions.dart';
import '../../../../Core/helpers/Internet_handler.dart';
import '../../../../Core/models/user_model.dart';
import '../../../../Core/networking/api_result.dart';
import 'leaderboard_page_repo.dart';

class LeaderboardPageRepoImpl implements LeaderboardPageRepo {
  @override
  Future<ApiResult<List<UserModel>>> getTopUsers() async {
    try {
      await InternetHandler.isInternetAvailable();
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('totalPoints', descending: true)
          .get();
      final users = querySnapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
      return ApiSuccess(users);
    } on Exception catch (e) {
      return ApiFailure(HandleNetworkExceptions.getExceptionType(e));
    }
  }
}
