


import 'package:flutter/material.dart';

import '../utillis/app_colors.dart';

class CircularProgressLoadingIndicator extends StatelessWidget {
  const CircularProgressLoadingIndicator({super.key, this.progressIndicatorColor});

  final Color? progressIndicatorColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
            color: progressIndicatorColor??AppColors.primaryColor,
            strokeWidth: 2

        ));
  }
}
