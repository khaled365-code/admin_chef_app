


import 'package:admin_chef_app/core/commons/functions/common_functions.dart';
import 'package:admin_chef_app/core/routes/admin_routes.dart';
import 'package:admin_chef_app/core/utillis/app_styles.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      backgroundColor: AppColors.cFFF6EE,
      body: SafeArea(
            child: Padding(
              padding:  EdgeInsetsDirectional.only(start: 21.w),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ImageAdminLoginSection()),
                        Container(
                          width: 87.w,
                          color: AppColors.white,
                        ),
                        Expanded(
                            child: Form(
                              key: LoginCubit.get(context).loginFormKey,
                              child: Container(
                                color: AppColors.white,
                                child: BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccessState)
                              {
                                buildScaffoldMessenger(
                                    context: context,
                                    msg: 'You logged in successfully');
                                navigate(
                                    context: context,
                                    route: AdminRoutes.mainDashboardScreen);
                              }
                              if (state is LoginFailureState)
                              {
                                handleErrorinListenerFun(state, context);
                              }
                            },
                            builder: (context, state) {
                              return Padding(
                                padding:  EdgeInsetsDirectional.only(end:125.w,top: 52.h),
                                child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsetsDirectional.zero,
                                          leading: SvgPicture.asset(ImageConstants.hitlerIcon),
                                          title: Text('Chef Management System',
                                            style: AppTextStyles.semiBold16(context).copyWith(
                                                    color: AppColors.c07143B,
                                                  fontFamily: 'Poppins'),
                                          ),
                                        ),
                                        SpaceWidget(height: 210,),
                                        Text(
                                          'Welcome !',
                                          style: AppTextStyles.bold40(context).copyWith(
                                                      color: AppColors.c07143B),
                                        ),
                                        SpaceWidget(height: 14,),
                                        Text(
                                          'Welcome back, Please enter your details.',
                                          style: AppTextStyles.regular16(context).copyWith(
                                            color: AppColors.c959895,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        SpaceWidget(height: 30,),
                                        EmailLoginTextField(loginCubit: LoginCubit.get(context)),
                                        SpaceWidget(height: 30,),
                                        PasswordLoginTextField(loginCubit: LoginCubit.get(context)),
                                        SpaceWidget(height: 36,),
                                        TermsAndConditionsRow(loginCubit: LoginCubit.get(context)),
                                        SpaceWidget(height: 36,),
                                        state is LoginLoadingState ?
                                        const Center(
                                        child: CustomCircularProgressLoadingIndicator(
                                          progressIndicatorColor: AppColors.primaryColor,))
                                        : LoginButton(loginCubit: LoginCubit.get(context)),
                                          SpaceWidget(height: 45,),
                                        DontHaveAccountRow(),
                                        Spacer()
                                      ],),
                              );},),),
                            ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }


}











