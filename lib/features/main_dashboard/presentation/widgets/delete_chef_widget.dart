

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

class DeleteChefWidget extends StatelessWidget {
  const DeleteChefWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: MainDashboardCubit.get(context).deleteChefFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceWidget(height: 72,),
          CustomOulinedTextField(
            controller: MainDashboardCubit.get(context).deleteChefIdController,
            hintText: 'please enter chef id here !',
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
          ),
          const SpaceWidget(height: 68,),
          BlocConsumer<MainDashboardCubit, MainDashboardState>(
            listener: (context, state) {
              if(state is DeleteChefSuccessState)
              {
                buildScaffoldMessenger(
                    context: context,
                    msg: 'Chef deleted successfully from the system !',
                  iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
                  snackBarBehavior: SnackBarBehavior.floating
                );
                MainDashboardCubit.get(context).deleteChefIdController.clear();
              }
              if(state is DeleteChefFailureState)
              {
                handleDeleteChefErrorListenerFun(state, context);
              }
            },
            builder: (context, state) {
              if(state is DeleteChefLoadingState)
              {
                return const Center(child: CustomCircularProgressLoadingIndicator(),);
              }
              return SharedButton(
                btnSize: const WidgetStatePropertyAll(
                  Size(188, 44),
                ),
                borderRadiusValue: 24,
                btnText: 'Delete',
                btnTextStyle: AppTextStyles.regular16(context).copyWith(
                    color: AppColors.white,
                    fontFamily: 'Poppins'
                ),
                btnColor: const WidgetStatePropertyAll(AppColors.primaryColor),
                onPressessed: ()
                {
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

  void handleDeleteChefErrorListenerFun(DeleteChefFailureState state, BuildContext context) {
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
}
