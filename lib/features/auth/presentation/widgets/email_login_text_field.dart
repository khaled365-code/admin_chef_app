

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../cubits/login_cubit/login_cubit.dart';

class EmailLoginTextField extends StatelessWidget {
  const EmailLoginTextField({
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
          return 'You must enter your email';
        }
        if(EmailValidator.validate(value)==false)
        {
          return 'You must enter a valid email';
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
      controller: loginCubit.emailController,
      decoration: InputDecoration(
          labelText: 'Email',
          floatingLabelStyle:
          AppTextStyles.regular20(context)
              .copyWith(
              color: AppColors.black),
          labelStyle: AppTextStyles.regular20(
              context),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.cA69999)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.cA69999)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.cA69999))),
    );
  }
}