

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
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
      keyboardType: TextInputType.emailAddress,
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
      cursorColor: AppColors.primaryColor,
      onFieldSubmitted: (value)
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
      controller: loginCubit.emailController,
      decoration: InputDecoration(
          labelText: 'Email',
          floatingLabelStyle:
          AppTextStyles.regular16(context).copyWith(
              color: AppColors.c959895,
              fontFamily: 'Poppins'
          ),
          labelStyle: AppTextStyles.regular16(context).copyWith(
            color: AppColors.c959895,
            fontFamily: 'Poppins'
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor)),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor))),
    );
  }
}