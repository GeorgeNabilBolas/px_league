import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/models/user_model.dart';
import '../../../../../Core/widgets/custom_loading_widget.dart';
import '../../../data/repo/leaderboard_page_repo.dart';

part 'leader_board_page_cubit_state.dart';

class LeaderBoardPageCubit extends Cubit<LeaderBoardPageCubitState> {
  LeaderBoardPageCubit(this._mainPageRepo) : super(LeaderBoardPageCubitInitial());
  final LeaderboardPageRepo _mainPageRepo;
  Future<void> getTopUsers() async {
    emit(LeaderBoardPageCubitLoading());
    final result = await _mainPageRepo.getTopUsers();
    result.when(
      onSuccess: (users) => emit(LeaderBoardPageCubitSuccess(users: users)),
      onFailure: (error) => emit(LeaderBoardPageCubitError(message: error.message)),
    );
  }
}
