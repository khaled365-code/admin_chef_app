


import 'package:admin_chef_app/core/commons/functions/common_functions.dart';
import 'package:admin_chef_app/core/routes/admin_routes.dart';
import 'package:admin_chef_app/core/utillis/app_styles.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utillis/app_assets.dart';
import '../../../../core/utillis/app_colors.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginSuccessState)
      {
        buildScaffoldMessenger(context: context, msg: 'You logged in successfully');
        navigate(context: context, route: AdminRoutes.adminHomeScreen,replacement: true);
      }
    if(state is LoginFailureState)
      {

        if(state.errorModel.error!=null)
        {
          buildScaffoldMessenger(context: context, msg: state.errorModel.error!.toString().substring(1,state.errorModel.error!.toString().length-1));
        }
        else
        {
          buildScaffoldMessenger(context: context, msg: state.errorModel.errorMessage!);
        }
      }
  },
  builder: (context, state) {
    var loginCubit=BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.cFFF6EE,
      body: SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 21),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                              color: AppColors.cFFF6EE,
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SpaceWidget(
                                height: 52,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageConstants.admin3ItemsLogoIcon,
                                  ),
                                  SpaceWidget(width: 19),
                                  Text(
                                    'Chef & APP',
                                    style: AppTextStyles.semiBold25(context)
                                        .copyWith(color: AppColors.black),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              AspectRatio(
                                aspectRatio: 763 / 865,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.cFFF6EE,
                                  ),
                                  child: Image.asset(
                                    ImageConstants.dishes4Image,
                                  ),
                                ),
                              ),
                              SpaceWidget(height: 41)
                            ],
                          ),
                        )),
                        Container(
                          width: 87,
                          color: AppColors.white,
                        ),
                        Expanded(
                            child: Form(
                              key: loginCubit.loginFormKey,
                              child: Container(
                                color: AppColors.white,
                                child: Padding(
                                    padding: EdgeInsetsDirectional.only(end: 139),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SpaceWidget(
                                            height: 52,
                                          ),
                                          ListTile(
                                            leading: SvgPicture.asset(
                                                ImageConstants.hitlerIcon),
                                            title: Text(
                                              'Chef Management System',
                                              style:
                                                  AppTextStyles.semiBold20(context)
                                                      .copyWith(
                                                          color: AppColors.c1D1D1B),
                                            ),
                                          ),
                                          SpaceWidget(height: 210,),
                                          Text(
                                            'Welcome back Anas',
                                            style:
                                                AppTextStyles.extraBold36(context)
                                                    .copyWith(
                                                        color: AppColors.black),
                                          ),
                                          SpaceWidget(
                                            height: 14,
                                          ),
                                          Text(
                                            'Welcome back! Please enter your details.',
                                            style: AppTextStyles.regular20(context),
                                          ),
                                          SpaceWidget(
                                            height: 42,
                                          ),
                                          TextFormField(
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
                                              if(loginCubit.loginFormKey.currentState!.validate())
                                                {
                                                  loginCubit.loginFun(
                                                      email: loginCubit.emailController.text,
                                                      password: loginCubit.passwordController.text);
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
                                          ),
                                          SpaceWidget(
                                            height: 30,
                                          ),
                                          TextFormField(
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
                                              if(loginCubit.loginFormKey.currentState!.validate())
                                              {
                                                loginCubit.loginFun(
                                                    email: loginCubit.emailController.text,
                                                    password: loginCubit.passwordController.text);
                                              }
                                            },
                                            controller:
                                                loginCubit.passwordController,
                                            obscureText: loginCubit.isObsecureText,
                                            decoration: InputDecoration(
                                                floatingLabelStyle:
                                                    AppTextStyles.regular20(context)
                                                        .copyWith(
                                                            color: AppColors.black),
                                                labelText: 'Password',
                                                labelStyle: AppTextStyles.regular20(
                                                    context),
                                                suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      loginCubit.changeEyeShape();
                                                    },
                                                    child: Icon(
                                                        loginCubit.suffixIcon,color: AppColors.c1A1717,)),
                                                enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors.cA69999)),
                                                border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors.cA69999)),
                                                focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors.cA69999))),
                                          ),
                                          SpaceWidget(
                                            height: 27,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(2),
                                                    border: Border.all(
                                                        color: AppColors.cD5D5D5)),
                                              ),
                                              SpaceWidget(
                                                width: 8,
                                              ),
                                              Text(
                                                'Terms & Conditions ',
                                                style:
                                                    AppTextStyles.regular15(context)
                                                        .copyWith(
                                                            color: AppColors.black),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Forgot Password',
                                                style:
                                                    AppTextStyles.regular15(context)
                                                        .copyWith(
                                                            color: AppColors.black),
                                              ),
                                            ],
                                          ),
                                          SpaceWidget(
                                            height: 36,
                                          ),
                                          state is LoginLoadingState?
                                          Center(
                                            child: SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: CircularProgressIndicator(
                                                  color: AppColors.primaryColor,
                                                  strokeWidth: 2

                                                )),
                                          ):
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.c060606,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              fixedSize: Size(1000, 60)
                                            ),
                                            onPressed: () {
                                              if(loginCubit.loginFormKey.currentState!.validate())
                                              {
                                                loginCubit.loginFun(
                                                    email: loginCubit.emailController.text,
                                                    password: loginCubit.passwordController.text);
                                              }
                                            },
                                            child: Text(
                                              'Log in',
                                              style: AppTextStyles.bold16(context)
                                                  .copyWith(color: AppColors.white),
                                            ),
                                          ),
                                          SpaceWidget(
                                            height: 36,
                                          ),
                                          Row(
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
                                              Text(
                                                'Sign up for free',
                                                style:
                                                AppTextStyles.medium16(context)
                                                    .copyWith(
                                                    color: AppColors.black),
                                              ),
                                            ],
                                          ),
                                          Spacer()
                                        ])),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  },
);
  }
}
