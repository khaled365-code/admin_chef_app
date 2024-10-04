

import 'package:admin_chef_app/core/commons/functions/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
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
              color: AppColors.c07143B,
              fontFamily: 'Poppins'
          ),
        ),
        const SpaceWidget(
          width: 8,
        ),
        GestureDetector(
          onTap: ()
          {
            buildScaffoldMessenger(
              snackBarBehavior: SnackBarBehavior.floating,
                context: context, msg: 'New admin registration is locked right now',
              iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25,),
            );
          },
          child: Text(
            'Click here to sign up',
            style:
            AppTextStyles.regular16(context)
                .copyWith(
                color: AppColors.primaryColor,
                fontFamily: 'Poppins'
            ),
          ),
        ),
      ],
    );
  }
}
