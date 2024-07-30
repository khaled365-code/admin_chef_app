


import 'package:admin_chef_app/core/utillis/app_styles.dart';
import 'package:admin_chef_app/features/main_dashboard/data/models/drawer_data_model/drawer_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utillis/app_colors.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({super.key, required this.drawerDataModel, this.onListTileTap,});

  final DrawerDataModel drawerDataModel;
  final void Function()? onListTileTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onListTileTap,
      child: ListTile(
        contentPadding: EdgeInsetsDirectional.zero,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
            color: AppColors.cF5F5F5
          ),
            child: Center(child: SvgPicture.asset(drawerDataModel.image,colorFilter: ColorFilter.mode(AppColors.cC8CAC8, BlendMode.srcIn),))),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(drawerDataModel.text,style: AppTextStyles.regular16(context).copyWith(
            color: drawerDataModel.itemIsSelected==false?AppColors.c959895:AppColors.primaryColor,
            fontFamily: 'Poppins',
          ),),
        ),
      ),
    );
  }
}
