


import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomCircularProgressLoadingIndicator extends StatelessWidget {
  const CustomCircularProgressLoadingIndicator({super.key, this.progressIndicatorColor});

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
