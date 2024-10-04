


import 'package:admin_chef_app/features/main_dashboard/data/models/drawer_data_model/drawer_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({super.key, required this.drawerDataModel, this.onListTileTap,});

  final DrawerDataModel drawerDataModel;
  final void Function()? onListTileTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onListTileTap,
      contentPadding: EdgeInsetsDirectional.only(bottom: 10.h,start: 30.w,end: 20.w),
      leading: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
          color: AppColors.cF5F5F5
        ),
          child: Center(child: SvgPicture.asset(drawerDataModel.image,colorFilter: const ColorFilter.mode(AppColors.cC8CAC8, BlendMode.srcIn),))),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Text(drawerDataModel.text,style: AppTextStyles.regular16(context).copyWith(
          color: drawerDataModel.itemIsSelected==false?AppColors.c959895:AppColors.primaryColor,
          fontFamily: 'Poppins',
        ),),
      ),
    );
  }
}
