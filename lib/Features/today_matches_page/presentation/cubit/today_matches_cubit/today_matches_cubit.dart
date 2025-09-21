import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/errors/api_exceptions/network_exptions.dart';
import '../../../../../Core/models/matches_model.dart';
import '../../../../../Core/widgets/custom_loading_widget.dart';
import '../../../data/repo/today_matches_repo.dart';

part 'today_matches_state.dart';

class TodayMatchesCubit extends Cubit<TodayMatchesState> {
  TodayMatchesCubit(this._mainPageRepo) : super(TodayMatchesInitial());
  final TodayMatchesRepo _mainPageRepo;

  Future<void> getTodayMatches() async {
    emit(TodayMatchesLoading());
    final result = await _mainPageRepo.getTodayMatches();
    result.when(
      onSuccess: (matches) => emit(TodayMatchesSuccess(matches: matches)),
      onFailure: (exception) => emit(TodayMatchesFailure(error: exception)),
    );
  }
}
