


import 'package:admin_chef_app/core/widgets/adaptive_layout_widget.dart';
import 'package:admin_chef_app/core/widgets/desktop_root_layout.dart';
import 'package:flutter/material.dart';

class AdminMealTimeApp extends StatelessWidget
{
  const AdminMealTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayoutWidget(
        mobileLayout: (context) => SizedBox(),
        tabletLayout: (context) => SizedBox(),
        desktopLayout: (context) => DesktopRootLayout(),);
  }
}
