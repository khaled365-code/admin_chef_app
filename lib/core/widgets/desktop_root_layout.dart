

import 'package:flutter/material.dart';

import '../routes/admin_router.dart';
import '../routes/admin_routes.dart';

class DesktopRootLayout extends StatelessWidget {
  const DesktopRootLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AdminRoutes.adminLoginScreen,
      onGenerateRoute: AdminRouter.generateAppRoutes,
    );;
  }
}
