


import 'package:admin_chef_app/core/widgets/custom_oulined_text_field.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
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
          SpaceWidget(height: 72,),
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
            onFieldSubmitted: (value){},
          ),
          SpaceWidget(height: 68,),
          BlocConsumer<MainDashboardCubit, MainDashboardState>(
            listener: (context, state) {
             if(state is DeleteMealSuccessState)
               {
                 buildScaffoldMessenger(context: context, msg: 'Meal deleted successfully !');
                 MainDashboardCubit.get(context).mealIdDeleteMealController.clear();
               }
             if(state is DeleteMealFailureState)
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
              if(state is DeleteMealLoadingState)
                {
                  return Center(child: CustomCircularProgressLoadingIndicator(),);
                }
              return SharedButton(
                btnSize: WidgetStatePropertyAll(
                  Size(188, 44),
                ),
                btnTextStyle: AppTextStyles.regular16(context).copyWith(
                    color: AppColors.white,
                    fontFamily: 'Poppins'
                ),
                borderRadiusValue: 24,
                btnText: 'Delete',
                btnColor: WidgetStatePropertyAll(AppColors.primaryColor),
                onPressessed: () {
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
}
