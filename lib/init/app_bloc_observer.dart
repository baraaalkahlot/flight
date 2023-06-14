import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print('AppBlocObserver::: onEvent : $event \n\n\n');
    }
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print('AppBlocObserver::: onTransition : $transition \n\n\n');
    }
    super.onTransition(bloc, transition);
  }

/*  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('AppBlocObserver::: blocBase :: onChange : $change \n\n\n');
    }
    super.onChange(bloc, change);
  }*/

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('AppBlocObserver::: onError : $error $stackTrace \n\n\n');
    }
    super.onError(bloc, error, stackTrace);
  }
}
