


import 'package:admin_chef_app/core/commons/functions/common_functions.dart';
import 'package:admin_chef_app/core/widgets/custom_oulined_text_field.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utillis/app_colors.dart';
import '../../../../core/widgets/progress_loading_indicator.dart';
import '../../../../core/widgets/shared_button.dart';

class ChefRequestWidget extends StatelessWidget {
  const ChefRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainDashboardCubit, MainDashboardState>(
  listener: (context, state) {
    if(state is DealWithChefRequestSuccessState)
      {
        buildScaffoldMessenger(context: context, msg: state.successMessage);
        MainDashboardCubit.get(context).statusControllerForChefRequest.clear();
        MainDashboardCubit.get(context).chefIdForControllerForChefRequest.clear();
      }
    if(state is DealWithChefRequestFailureState)
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
      key: MainDashboardCubit.get(context).dealWithChefRequestFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpaceWidget(height: 64,),
          CustomOulinedTextField(
              controller: MainDashboardCubit.get(context).chefIdForControllerForChefRequest,
            hintText: 'please write chef id here !',
            labelText: 'Chef Id',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            validator: (value){
              if(value!.isEmpty)
              {
                return 'you must write chef id !';
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
              controller: MainDashboardCubit.get(context).statusControllerForChefRequest,
            validator: (value){
              if(value!.isEmpty)
              {
                return 'you must write and select one status';
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
          state is DealWithChefRequestLoadingState?
          Center(child: CustomCircularProgressLoadingIndicator(),):
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
              if(MainDashboardCubit.get(context).dealWithChefRequestFormKey.currentState!.validate())
                {
                  MainDashboardCubit.get(context).dealWithChefRequestFun(
                      chefId: MainDashboardCubit.get(context).chefIdForControllerForChefRequest.text,
                      status: MainDashboardCubit.get(context).statusControllerForChefRequest.text);
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
