

import 'package:admin_chef_app/core/commons/functions/common_functions.dart';
import 'package:flutter/material.dart';

import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style:
          AppTextStyles.regular16(context)
              .copyWith(
              color: AppColors.black),
        ),
        SpaceWidget(
          width: 8,
        ),
        GestureDetector(
          onTap: ()
          {
            buildScaffoldMessenger(context: context, msg: 'New admin registration is locked right now');
          },
          child: Text(
            'Sign up for free',
            style:
            AppTextStyles.medium16(context)
                .copyWith(
                color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
