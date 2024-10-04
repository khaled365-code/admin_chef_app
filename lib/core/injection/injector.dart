


import 'package:admin_chef_app/core/database/api/dio_consumer.dart';
import 'package:admin_chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:admin_chef_app/features/main_dashboard/data/repos/dashboard_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/main_dashboard/presentation/cubits/categories_cubit/categories_cubit.dart';
import '../../features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';


GetIt serviceLocator=GetIt.instance;



setUpLocator()
{


  serviceLocator.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()),);

  serviceLocator.registerLazySingleton<AuthRepoImplementation>(() => AuthRepoImplementation(api: serviceLocator.get<DioConsumer>()),);

  serviceLocator.registerLazySingleton<DashBoardRepoImplementation>(() => DashBoardRepoImplementation(api: serviceLocator.get<DioConsumer>()),);


  serviceLocator.registerFactory(() => LoginCubit(authRepoImplementation: serviceLocator.get<AuthRepoImplementation>()),);

  serviceLocator.registerFactory(() => MainDashboardCubit(dashBoardRepoImplementation: serviceLocator.get<DashBoardRepoImplementation>()),);

  serviceLocator.registerFactory(() => CategoriesCubit(),);




}