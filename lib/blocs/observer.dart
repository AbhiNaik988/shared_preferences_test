import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyGlobalObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint("bloc: onCreate: bloc: ${bloc.toString()}");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint("bloc: onTransition: transition: ${transition.toString()}");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint("bloc: onChange: change: ${change.toString()}");
    debugPrint("bloc: onChange: currentState: ${change.currentState.toString()}");
    debugPrint("bloc: onChange: nextState: ${change.nextState.toString()}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint("bloc: onError: error: ${error.toString()}");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint("bloc: onEvent: event: ${event.toString()}");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint("bloc: onClose: bloc: ${bloc.toString()}");
  }
}
