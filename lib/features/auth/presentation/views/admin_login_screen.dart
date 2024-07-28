


import 'package:admin_chef_app/core/commons/functions/common_functions.dart';
import 'package:admin_chef_app/core/database/api/api_keys.dart';
import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:admin_chef_app/core/routes/admin_routes.dart';
import 'package:admin_chef_app/core/utillis/app_styles.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utillis/app_assets.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/widgets/progress_loading_indicator.dart';
import '../widgets/dont_have_account_row.dart';
import '../widgets/email_login_text_field.dart';
import '../widgets/left_part_login_section.dart';
import '../widgets/login_button.dart';
import '../widgets/password_login_text_field.dart';
import '../widgets/terms_and_conditions_row.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginSuccessState)
      {
        buildScaffoldMessenger(context: context, msg: 'You logged in successfully');
        navigate(context: context, route: AdminRoutes.mainDashboardScreen,replacement: true);
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
                        ImageAdminLoginSection(),
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
                                          EmailLoginTextField(loginCubit: loginCubit),
                                          SpaceWidget(
                                            height: 30,
                                          ),
                                          PasswordLoginTextField(loginCubit: loginCubit),
                                          SpaceWidget(
                                            height: 27,
                                          ),
                                          TermsAndConditionsRow(loginCubit: loginCubit),
                                          SpaceWidget(
                                            height: 36,
                                          ),
                                          state is LoginLoadingState?
                                          Center(child: CircularProgressLoadingIndicator(
                                            progressIndicatorColor: AppColors.c060606,
                                          )):
                                          LoginButton(loginCubit: loginCubit),
                                          SpaceWidget(
                                            height: 36,
                                          ),
                                          DontHaveAccountRow(),
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











