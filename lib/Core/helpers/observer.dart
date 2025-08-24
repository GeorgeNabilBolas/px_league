import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log("onChange: ${bloc.runtimeType}, $change");
  }

  @override
  void onClose(BlocBase bloc) {
    log("onClose: ${bloc.runtimeType}");
  }

  @override
  void onCreate(BlocBase bloc) {
    log("onCreate: ${bloc.runtimeType}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("onError: ${bloc.runtimeType}, $error");
  }

  @override
  void onTransition(BlocBase bloc, Transition transition) {
    log("onTransition: ${bloc.runtimeType}, $transition");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log("onEvent: ${bloc.runtimeType}, $event");
  }
}
