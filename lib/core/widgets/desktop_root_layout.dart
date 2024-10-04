
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../database/api/api_keys.dart';
import '../database/cache/cache_helper.dart';
import '../routes/admin_router.dart';
import '../routes/admin_routes.dart';

class DesktopRootLayout extends StatelessWidget
{
  const DesktopRootLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 2114),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:  CacheHelper().getData(key: ApiKeys.token)!=null? AdminRoutes.mainDashboardScreen:AdminRoutes.adminLoginScreen,
          onGenerateRoute: AdminRouter.generateAppRoutes,
        );
      },
    );
  }
}
