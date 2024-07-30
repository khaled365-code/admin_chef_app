

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/widgets/custom_oulined_text_field.dart';
import '../../../../core/widgets/progress_loading_indicator.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/main_dashboard_cubit/main_dashboard_cubit.dart';

class DeleteChefWidget extends StatelessWidget {
  const DeleteChefWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: MainDashboardCubit.get(context).deleteChefFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpaceWidget(height: 64,),
          CustomOulinedTextField(
            controller: MainDashboardCubit.get(context).deleteChefIdController,
            hintText: 'please enter chef id here !',
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
          BlocConsumer<MainDashboardCubit, MainDashboardState>(
            listener: (context, state) {
              if(state is DeleteChefSuccessState)
              {
                buildScaffoldMessenger(context: context, msg: 'Chef deleted successfully from the system !');
                MainDashboardCubit.get(context).deleteChefIdController.clear();
              }
              if(state is DeleteChefFailureState)
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
              if(state is DeleteChefLoadingState)
              {
                return Center(child: CustomCircularProgressLoadingIndicator(),);
              }
              return SharedButton(
                btnSize: WidgetStatePropertyAll(
                  Size(188, 64),
                ),
                borderRadiusValue: 6,
                btnText: 'Delete',
                btnColor: WidgetStatePropertyAll(AppColors.primaryColor),
                onPressessed: () {
                  if (MainDashboardCubit.get(context)
                      .deleteChefFormKey
                      .currentState!
                      .validate()) {
                    MainDashboardCubit.get(context).deleteChefFun(
                        chefId: MainDashboardCubit.get(context).deleteChefIdController.text);
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
