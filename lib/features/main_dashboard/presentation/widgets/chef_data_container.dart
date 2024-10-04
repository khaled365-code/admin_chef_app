


import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/chefs_data/chefs.dart';

class ChefDataContainer extends StatelessWidget {
  const ChefDataContainer({super.key, required this.chefsData, required this.containerIsSelected,});

  final ChefsData chefsData;
  final bool containerIsSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerIsSelected==true?AppColors.primaryColor:AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: AppColors.cF3F4F6
        )
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SpaceWidget(height: 40,),
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(ImageConstants.chefBigImage),fit: BoxFit.fill)
              ),
            ),
            const SpaceWidget(height: 40,),
            Text(chefsData.name!,style: AppTextStyles.semiBold16(context).copyWith(
              color: containerIsSelected==true?AppColors.white:AppColors.c07143B
            ),),
            const SpaceWidget(height: 8,),
            FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
              child: Text(chefsData.email!,style: AppTextStyles.regular13(context).copyWith(
                  color: containerIsSelected==true?AppColors.white: AppColors.c898E99
              ),),
            ),
            const SpaceWidget(height: 8,),
            Text('+20 ${chefsData.phone!}',style: AppTextStyles.regular13(context).copyWith(
                color: containerIsSelected==true?AppColors.white:AppColors.c898E99
            ),),
            const SpaceWidget(height: 24,),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text('Id : ${chefsData.id!}',style: AppTextStyles.regular13(context).copyWith(
                  color: containerIsSelected==true?AppColors.white:AppColors.primaryColor
              ),),
            ),
            const SpaceWidget(height: 8,),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text('Chef Status : ${chefsData.status!}',style: AppTextStyles.regular13(context).copyWith(
                  color: containerIsSelected==true?AppColors.white:AppColors.primaryColor
              ),),
            ),





          ],
        ),
      ),
    );
  }
}
