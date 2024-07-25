


import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver implements BlocObserver {


  @override
  void onChange(BlocBase bloc, Change change) {
    print('cubit $bloc is changed to $change');
  }

  @override
  void onClose(BlocBase bloc) {
    print('cubit $bloc is closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    print('cubit $bloc is created');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('cubit $bloc has error $error');

  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('cubit $bloc has event $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('cubit $bloc has transition $transition');
  }

}