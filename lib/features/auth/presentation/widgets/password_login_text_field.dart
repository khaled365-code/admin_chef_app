

import 'package:flutter/material.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../cubits/login_cubit/login_cubit.dart';

class PasswordLoginTextField extends StatelessWidget {
  const PasswordLoginTextField({
    super.key,
    required this.loginCubit,
  });

  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value)
      {
        if(value!.isEmpty)
        {
          return 'You must enter your password';
        }
        else
        {
          return null;
        }
      },
      onFieldSubmitted: (value)
      {
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
      controller:
      loginCubit.passwordController,
      obscureText: loginCubit.isObsecureText,
      decoration: InputDecoration(
          floatingLabelStyle:
          AppTextStyles.regular16(context).copyWith(
              color: AppColors.c959895,
              fontFamily: 'Poppins'
          ),
          labelText: 'Password',
          labelStyle: AppTextStyles.regular16(context).copyWith(
              color: AppColors.c959895,
              fontFamily: 'Poppins'
          ),
          suffixIcon: GestureDetector(
              onTap: () {
                loginCubit.changeEyeShape();
              },
              child: Icon(
                loginCubit.suffixIcon,color: AppColors.c959895,)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor))),
    );
  }
}