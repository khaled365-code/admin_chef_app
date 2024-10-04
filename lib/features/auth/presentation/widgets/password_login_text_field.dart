

import 'package:flutter/material.dart';
import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
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
      keyboardType: TextInputType.text,
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
      controller:
      loginCubit.passwordController,
      obscureText: loginCubit.passwordSecureText,
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
              onTap: ()
              {
                loginCubit.changeEyeShape();
              },
              child: Icon(loginCubit.suffixIcon,color: AppColors.c959895,)),
          enabledBorder: const UnderlineInputBorder(
              borderSide:  BorderSide(
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