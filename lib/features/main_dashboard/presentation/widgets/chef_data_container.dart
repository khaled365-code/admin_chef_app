


import 'package:admin_chef_app/core/utillis/app_styles.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utillis/app_assets.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../data/models/chefs_data/chefs.dart';

class ChefDataContainer extends StatelessWidget {
  const ChefDataContainer({super.key, required this.chefsData,});

  final ChefsData chefsData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.cF3F4F6
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpaceWidget(height: 20,),
          Container(
            width: 113,
            height: 113,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(ImageConstants.chefBigImage),fit: BoxFit.fill)
            ),
          ),
          SpaceWidget(height: 20,),
          Text(chefsData.name!,style: AppTextStyles.semiBold14(context).copyWith(
            color: AppColors.c898E99
          ),),
          SpaceWidget(height: 10,),
          Text(chefsData.email!,style: AppTextStyles.regular10(context).copyWith(
              color: AppColors.primaryColor
          ),),
          SpaceWidget(height: 5,),
          Text('+20 ${chefsData.phone!}',style: AppTextStyles.regular10(context).copyWith(
              color: AppColors.primaryColor
          ),),
          SpaceWidget(height: 5,),
          Text('Id : ${chefsData.id!}',style: AppTextStyles.regular10(context).copyWith(
              color: AppColors.primaryColor
          ),),
          SpaceWidget(height: 5,),
          Text('Chef Status : ${chefsData.status!}',style: AppTextStyles.regular10(context).copyWith(
              color: AppColors.primaryColor
          ),),





        ],
      ),
    );
  }
}
