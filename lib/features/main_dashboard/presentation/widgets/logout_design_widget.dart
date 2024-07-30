import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:admin_chef_app/core/routes/admin_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/main_dashboard_cubit/main_dashboard_cubit.dart';

class LogoutDesignWidget extends StatelessWidget {
  const LogoutDesignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainDashboardCubit, MainDashboardState>(
      listener: (context, state) {
        if(state is AdminLogoutSuccessState)
        {
          CacheHelper().clearData();
          Future.delayed(Duration(seconds: 5));
          buildScaffoldMessenger(context: context, msg: 'Logout successfully !');
          Navigator.pop(context);
        }
        if(state is AdminLogoutFailureState)
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            SpaceWidget(height: 64,),
            Text('Logout From System',
              style: AppTextStyles.bold23(context).copyWith(
                  color: AppColors.c07143B
              ),),

          ],
        );
      },
    );
  }
}
