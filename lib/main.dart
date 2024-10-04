import 'package:admin_chef_app/core/bloc_observer/bloc_observer.dart';
import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'admin_meal_time_app.dart';
import 'core/injection/injector.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setUpLocator();
  runApp(const AdminMealTimeApp());
  Bloc.observer=MyBlocObserver();

}

