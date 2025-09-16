import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/errors/api_exceptions/network_exptions.dart';
import '../../../../../Core/models/matches_model.dart';
import '../../../../../Features/main_page/data/repo/main_page_repo.dart';

part 'get_matches_state.dart';

class GetMatchesCubit extends Cubit<GetMatchesState> {
  GetMatchesCubit(this._mainPageRepo) : super(GetMatchesInitial());
  final MainPageRepo _mainPageRepo;

  Future<void> getTodayMatches() async {
    emit(GetMatchesLoading());
    final result = await _mainPageRepo.getTodayMatches();
    result.when(
      onSuccess: (matches) => emit(GetMatchesSuccess(matches: matches)),
      onFailure: (exception) => emit(GetMatchesFailure(error: exception)),
    );
  }
}
