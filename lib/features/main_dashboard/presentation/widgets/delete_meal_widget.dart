


import 'package:admin_chef_app/core/widgets/custom_oulined_text_field.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/progress_loading_indicator.dart';
import '../../../../core/widgets/shared_button.dart';

class DeleteMealWidget extends StatelessWidget {
  const DeleteMealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: MainDashboardCubit.get(context).deleteMealFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceWidget(height: 72,),
          CustomOulinedTextField(
            controller: MainDashboardCubit.get(context).mealIdDeleteMealController,
            hintText: 'please enter meal id here !',
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
          const SpaceWidget(height: 68,),
          BlocConsumer<MainDashboardCubit, MainDashboardState>(
            listener: (context, state) {
             if(state is DeleteMealSuccessState)
               {
                 buildScaffoldMessenger(
                     context: context,
                     msg: 'Meal deleted successfully !',
                   snackBarBehavior: SnackBarBehavior.floating,
                   iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
                 );
                 MainDashboardCubit.get(context).mealIdDeleteMealController.clear();
               }
             if(state is DeleteMealFailureState)
               {
                 handleDeleteMealListenerFun(state, context);
               }
            },
            builder: (context, state) {
              if(state is DeleteMealLoadingState)
                {
                  return const Center(child: CustomCircularProgressLoadingIndicator(),);
                }
              return SharedButton(
                btnSize: const WidgetStatePropertyAll(
                  Size(188, 44),
                ),
                btnTextStyle: AppTextStyles.regular16(context).copyWith(
                    color: AppColors.white,
                    fontFamily: 'Poppins'
                ),
                borderRadiusValue: 24,
                btnText: 'Delete',
                btnColor: const WidgetStatePropertyAll(AppColors.primaryColor),
                onPressessed: ()
                {
                  if (MainDashboardCubit.get(context)
                      .deleteMealFormKey
                      .currentState!
                      .validate()) {
                    MainDashboardCubit.get(context).deleteMealFun(
                        mealId: MainDashboardCubit.get(context)
                            .mealIdDeleteMealController
                            .text);
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

  void handleDeleteMealListenerFun(DeleteMealFailureState state, BuildContext context) {
    if (state.errorModel.error != null)
    {
      buildScaffoldMessenger(
        snackBarBehavior: SnackBarBehavior.floating,
          iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25,),
          context: context,
          msg: state.errorModel.error!.toString().substring(1, state.errorModel.error!.toString().length - 1));
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
}
