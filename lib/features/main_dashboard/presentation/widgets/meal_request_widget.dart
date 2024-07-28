


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/widgets/custom_oulined_text_field.dart';
import '../../../../core/widgets/progress_loading_indicator.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/main_dashboard_cubit/main_dashboard_cubit.dart';

class MealRequestWidget extends StatelessWidget {
  const MealRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainDashboardCubit, MainDashboardState>(
  listener: (context, state) {
    if(state is DealWithMealRequestSuccessState)
    {
      buildScaffoldMessenger(context: context, msg: state.successMessage);
      MainDashboardCubit.get(context).mealIdControllerForMealRequest.clear();
      MainDashboardCubit.get(context).mealStatusControllerForMealRequest.clear();
    }
    if(state is DealWithMealRequestFailureState)
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
    return Form(
      key: MainDashboardCubit.get(context).dealWithMealRequestFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpaceWidget(height: 64,),
          CustomOulinedTextField(
            controller: MainDashboardCubit.get(context).mealIdControllerForMealRequest,
            hintText: 'please write meal id here !',
            labelText: 'Meal Id',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            validator: (value){
              if(value!.isEmpty)
              {
                return 'you must write meal id !';
              }
              else
              {
                return null;
              }
            },
            onFieldSubmitted: (value){},
          ),
          SpaceWidget(height: 32,),
          CustomOulinedTextField(
            controller: MainDashboardCubit.get(context).mealStatusControllerForMealRequest,
            validator: (value){
              if(value!.isEmpty)
              {
                return 'you must write one status';
              }
              if(value.contains(' '))
              {
                return 'you must write one status only';
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
          SpaceWidget(height: 32,),
          state is DealWithMealRequestLoadingState?
          Center(child: CircularProgressLoadingIndicator(),):
          SharedButton(
            btnSize: WidgetStatePropertyAll(
              Size(188, 64),
            ),
            borderRadiusValue: 6,
            btnText: 'Modify',
            btnColor: WidgetStatePropertyAll(
                AppColors.primaryColor
            ),
            onPressessed: (){
              if(MainDashboardCubit.get(context).dealWithMealRequestFormKey.currentState!.validate())
              {
                MainDashboardCubit.get(context).dealWithMealRequestFun(
                    mealId: MainDashboardCubit.get(context).mealIdControllerForMealRequest.text,
                    status: MainDashboardCubit.get(context).mealStatusControllerForMealRequest.text);
              }
            },
          )

        ],
      ),
    );
  },
);
  }
}
