


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
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
          backgroundColor: AppColors.c060606,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          fixedSize: Size(1000, 60)
      ),
      onPressed: () {
        if(loginCubit.loginFormKey.currentState!.validate() )
        {
          if(loginCubit.termsCheckBoxValue==false)
          {
            buildScaffoldMessenger(context: context, msg: 'You should accept terms and conditions to login');
          }
          else
          {
            loginCubit.loginFun(
                email: loginCubit.emailController.text,
                password: loginCubit.passwordController.text);
          }

        }
      },
      child: Text(
        'Log in',
        style: AppTextStyles.bold16(context)
            .copyWith(color: AppColors.white),
      ),
    );
  }
}