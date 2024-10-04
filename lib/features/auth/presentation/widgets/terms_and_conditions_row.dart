

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/login_cubit/login_cubit.dart';

class TermsAndConditionsRow extends StatelessWidget {
  const TermsAndConditionsRow({
    super.key,
    required this.loginCubit,
  });

  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: ()
          {
            loginCubit.changeTermsCheckBoxValue();
          },
          child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
           color: loginCubit.termsCheckBoxValue==true?AppColors.primaryColor:AppColors.white,
              borderRadius:
              BorderRadius.circular(2),
              border: Border.all(
                  color: loginCubit.termsCheckBoxValue==true?
                  AppColors.primaryColor:
                  AppColors.c959895),),
          child: loginCubit.termsCheckBoxValue==true?
          Center(child: const Icon(Icons.check,color: AppColors.white,size: 17,)):const SizedBox.shrink(),),),
        const SpaceWidget(
          width: 8,
        ),
        Text(
          'Terms & Conditions ',
          style:
          AppTextStyles.regular16(context).copyWith(
              color: AppColors.c959895,
              fontFamily: 'Poppins'
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: ()
          {
            buildScaffoldMessenger(
              context: context,
              msg: 'This feature is locked right now',
              snackBarBehavior: SnackBarBehavior.floating,
                iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25,),);
          },
          child: Text(
            'Forgot Password',
            style:
            AppTextStyles.regular16(context).copyWith(
                color: AppColors.primaryColor,
                fontFamily: 'Poppins'

            ),
          ),
        ),
      ],
    );
  }
}