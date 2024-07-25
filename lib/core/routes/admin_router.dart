import 'package:admin_chef_app/core/injection/injector.dart';
import 'package:admin_chef_app/core/routes/admin_routes.dart';
import 'package:admin_chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:admin_chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/views/admin_login_screen.dart';
import '../../features/auth/presentation/views/home_screen.dart';

class AdminRouter {


  static Route? generateAppRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AdminRoutes.adminLoginScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => LoginCubit(authRepoImplementation: serviceLocator.get<AuthRepoImplementation>()),
              child: AdminLoginScreen(),
            ),);
      case AdminRoutes.adminHomeScreen:
        return MaterialPageRoute(builder: (context) =>
            HomeScreen(),);
    }
  }


}