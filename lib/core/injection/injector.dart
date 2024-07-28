


import 'package:admin_chef_app/core/database/api/dio_consumer.dart';
import 'package:admin_chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:admin_chef_app/features/main_dashboard/data/repos/dashboard_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator=GetIt.instance;



setUpLocator()
{

  serviceLocator.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));

  serviceLocator.registerSingleton<AuthRepoImplementation>(AuthRepoImplementation(api: serviceLocator.get<DioConsumer>()));


  serviceLocator.registerSingleton<DashBoardRepoImplementation>(DashBoardRepoImplementation(api: serviceLocator.get<DioConsumer>()));





}