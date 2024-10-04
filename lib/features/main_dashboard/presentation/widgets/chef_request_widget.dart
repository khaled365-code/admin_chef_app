


import 'package:admin_chef_app/core/commons/functions/common_functions.dart';
import 'package:admin_chef_app/core/utils/app_assets.dart';
import 'package:admin_chef_app/core/widgets/custom_oulined_text_field.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/progress_loading_indicator.dart';
import '../../../../core/widgets/shared_button.dart';

class ChefRequestWidget extends StatelessWidget {
  const ChefRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: MainDashboardCubit.get(context).dealWithChefRequestFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceWidget(height: 72,),
          CustomOulinedTextField(
              controller: MainDashboardCubit.get(context).chefIdForControllerForChefRequest,
            hintText: 'please write chef id here !',
            labelText: 'Chef Id',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            validator: (value){
              if(value!.isEmpty)
              {
                return 'you must specify chef id !';
              }
              else
              {
                return null;
              }
            },
            onFieldSubmitted: (value){},
          ),
          const SpaceWidget(height: 52,),
          CustomOulinedTextField(
              controller: MainDashboardCubit.get(context).statusControllerForChefRequest,
            validator: (value){
              if(value!.isEmpty)
              {
                return 'you must select one status';
              }
              if(value.contains(' '))
              {
                return 'you must select one status only';
              }
              else
              {
                return null;
              }
            },
            onFieldSubmitted: (value){},
            hintText: 'must be one of pending , accepted , rejected , all',
            labelText: 'Status',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          const SpaceWidget(height: 68,),
          BlocConsumer<MainDashboardCubit, MainDashboardState>(
              builder: (context, state)
              {
                if(state is DealWithChefRequestLoadingState)
                {
                  return const Center(child: CustomCircularProgressLoadingIndicator(),);
                }
                else
                  {
                    return SharedButton(
                      btnSize: const WidgetStatePropertyAll(
                        Size(188, 44),
                      ),
                      borderRadiusValue: 24,
                      btnText: 'Modify',
                      btnTextStyle: AppTextStyles.regular16(context).copyWith(
                          color: AppColors.white,
                          fontFamily: 'Poppins'
                      ),
                      btnColor: const WidgetStatePropertyAll(
                          AppColors.primaryColor
                      ),
                      onPressessed: ()
                      {
                        if(MainDashboardCubit.get(context).dealWithChefRequestFormKey.currentState!.validate())
                        {
                          MainDashboardCubit.get(context).dealWithChefRequestFun(
                              chefId: MainDashboardCubit.get(context).chefIdForControllerForChefRequest.text,
                              status: MainDashboardCubit.get(context).statusControllerForChefRequest.text);
                        }

                      },
                    );
                  }

              },
              listener: (context, state)
              {
                if(state is DealWithChefRequestSuccessState)
                {
                  chefRequestSuccessListener(context, state);
                }
                if(state is DealWithChefRequestFailureState)
                {
                  chefRequestFailureListener(state, context);
                }
              },)
        ],
      ),
    );
  }

  void chefRequestFailureListener(DealWithChefRequestFailureState state, BuildContext context) {
    if (state.errorModel.error != null)
    {
      buildScaffoldMessenger(
          iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25,),
          context: context,
          msg: state.errorModel.error!.toString().substring(
              1,
              state.errorModel.error!.toString().length - 1));
    }
    else
    {
      buildScaffoldMessenger(
          iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25),
          context: context,
          msg: state.errorModel.errorMessage!);
    }
  }

  void chefRequestSuccessListener(BuildContext context, DealWithChefRequestSuccessState state) {
     buildScaffoldMessenger(
        context: context,
        msg: state.successMessage,
        iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),snackBarBehavior: SnackBarBehavior.floating);
    MainDashboardCubit.get(context).statusControllerForChefRequest.clear();
    MainDashboardCubit.get(context).chefIdForControllerForChefRequest.clear();
  }
}
