

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubits/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.loginCubit,
  });

  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          fixedSize: Size(MediaQuery.sizeOf(context).width, 140.h)
      ),
      onPressed: ()
      {
        if(loginCubit.loginFormKey.currentState!.validate() )
        {
          loginCubit.loginFormKey.currentState!.save();
          if(loginCubit.termsCheckBoxValue==false)
          {
            buildScaffoldMessenger(
              snackBarBehavior: SnackBarBehavior.floating,
              context: context,
              msg: 'You should accept terms and conditions to login',
              iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25,),
            );
          }
          else
          {
            loginCubit.loginFun(
                email: loginCubit.emailController.text,
                password: loginCubit.passwordController.text);
          }

        }
        else
          {
            loginCubit.activateValidateMode();
          }
      },
      child: Text(
        'Sign in',
        style: AppTextStyles.regular16(context)
            .copyWith(color: AppColors.white,
            fontFamily: 'Poppins'

        ),
      ),
    );
  }
}