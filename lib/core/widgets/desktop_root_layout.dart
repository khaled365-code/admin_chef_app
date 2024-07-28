
import 'package:admin_chef_app/core/database/api/api_keys.dart';
import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import '../routes/admin_router.dart';
import '../routes/admin_routes.dart';

class DesktopRootLayout extends StatelessWidget {
  const DesktopRootLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CacheHelper().getData(key: ApiKeys.token)!=null? AdminRoutes.mainDashboardScreen:AdminRoutes.adminLoginScreen,
      onGenerateRoute: AdminRouter.generateAppRoutes,
    );
  }
}
