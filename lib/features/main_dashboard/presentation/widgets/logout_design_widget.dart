import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:admin_chef_app/core/routes/admin_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/main_dashboard_cubit/main_dashboard_cubit.dart';

class LogoutDesignWidget extends StatelessWidget {
  const LogoutDesignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainDashboardCubit, MainDashboardState>(
      listener: (context, state) {
        if(state is AdminLogoutSuccessState)
        {
           handleOnLogoutSuccessFun(context);
        }
        if(state is AdminLogoutFailureState)
        {
          handleErrorListenerFun(state, context);
        }
      },
      child: SizedBox.shrink(),
    );
  }
  void handleErrorListenerFun(AdminLogoutFailureState state, BuildContext context)
  {
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

  void handleOnLogoutSuccessFun(BuildContext context) async
  {
    await CacheHelper().clearData();
    buildScaffoldMessenger(
        context: context,
        msg: 'Logout successfully !',
        iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
        snackBarBehavior: SnackBarBehavior.floating
    );
    navigate(context: context, route: AdminRoutes.adminLoginScreen,replacement: true);
  }
}
