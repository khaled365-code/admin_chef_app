


import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver implements BlocObserver {


  @override
  void onChange(BlocBase bloc, Change change) {
    log('cubit $bloc is changed to $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('cubit $bloc is closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('cubit $bloc is created');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('cubit $bloc has error $error');

  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('$bloc has event $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('cubit $bloc has transition $transition');
  }

}