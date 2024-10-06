


import 'package:admin_chef_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_oulined_text_field.dart';
import '../../../../core/widgets/progress_loading_indicator.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/main_dashboard_cubit/main_dashboard_cubit.dart';

class MealRequestWidget extends StatelessWidget {
  const MealRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: MainDashboardCubit.get(context).dealWithMealRequestFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceWidget(height: 72,),
          CustomOulinedTextField(
            controller: MainDashboardCubit.get(context).mealIdControllerForMealRequest,
            hintText: 'please write meal id here !',
            labelText: 'Meal Id',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            validator: (value){
              if(value!.isEmpty)
              {
                return 'you must specify meal id !';
              }
              else
              {
                return null;
              }
            },
          ),
          const SpaceWidget(height: 52,),
          CustomOulinedTextField(
            controller: MainDashboardCubit.get(context).mealStatusControllerForMealRequest,
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
            hintText: 'must be one of pending , accepted , rejected , all',
            labelText: 'Status',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          const SpaceWidget(height: 68,),
          BlocConsumer<MainDashboardCubit, MainDashboardState>(
              builder: (context,state)
              {
                if (state is DealWithMealRequestLoadingState)
                  {
                    return  const Center(child: CustomCircularProgressLoadingIndicator(),);
                  }
                return SharedButton(
                  btnSize: const WidgetStatePropertyAll(
                    Size(188, 44),
                  ),
                  borderRadiusValue: 24,
                  btnText: 'Modify',
                  btnColor: const WidgetStatePropertyAll(
                      AppColors.primaryColor
                  ),
                  btnTextStyle: AppTextStyles.regular16(context).copyWith(
                      color: AppColors.white,
                      fontFamily: 'Poppins'
                  ),
                  onPressessed: ()
                  {
                    if(MainDashboardCubit.get(context).dealWithMealRequestFormKey.currentState!.validate())
                    {
                      MainDashboardCubit.get(context).dealWithMealRequestFun(
                          mealId: MainDashboardCubit.get(context).mealIdControllerForMealRequest.text,
                          status: MainDashboardCubit.get(context).mealStatusControllerForMealRequest.text);
                    }
                  },
                );
              },
              listener: (context,state)
              {
                  if (state is DealWithMealRequestSuccessState)
                  {
                    mealRequestSuccessListenerFun(context, state);
                  }
                  if (state is DealWithMealRequestFailureState)
                  {
                    mealRequestFailureListenerFun(state, context);
                  }
                },
              ),
        ],
      ),
    );
  }

  void mealRequestFailureListenerFun(DealWithMealRequestFailureState state, BuildContext context) {
    if (state.errorModel.error != null)
    {
      buildScaffoldMessenger(
          snackBarBehavior: SnackBarBehavior.floating,
          iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25,),
          context: context,
          msg: state.errorModel.error!.toString().substring(
              1,
              state.errorModel.error!.toString().length - 1));
    }
    else
    {
      buildScaffoldMessenger(
          snackBarBehavior: SnackBarBehavior.floating,
          iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25),
          context: context,
          msg: state.errorModel.errorMessage!);
    }
  }

  void mealRequestSuccessListenerFun(BuildContext context, DealWithMealRequestSuccessState state) {
     buildScaffoldMessenger(
        context: context,
        msg: state.successMessage,
      iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
      snackBarBehavior: SnackBarBehavior.floating
    );
    MainDashboardCubit.get(context).mealIdControllerForMealRequest.clear();
    MainDashboardCubit.get(context).mealStatusControllerForMealRequest.clear();
  }
}
