


import 'package:flutter/material.dart';

import '../../../../core/utillis/app_colors.dart';

class MealShimmerContainer extends StatelessWidget {
  const MealShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cD1D8E0,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 24,start: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FittedBox(
            //   child: Text('meal id: ${systemMeals.id!}',style: AppTextStyles.regular13(context).copyWith(
            //       color: containerISSelected==true?AppColors.white:AppColors.cEA6A12
            //   )),
            // ),
            // SpaceWidget(height: 10,),
            // Text(systemMeals.name!,style: AppTextStyles.semiBold16(context).copyWith(
            //     color: containerISSelected==true?AppColors.white:AppColors.c07143B
            // )),
            // SpaceWidget(height: 10,),
            // Text(systemMeals.description!,style: AppTextStyles.regular13(context).copyWith(
            //     color: containerISSelected==true?AppColors.white:AppColors.c959895
            // )),
            // SpaceWidget(height: 10,),
            // Text('chef name: ${systemMeals.chefId!.name!}',style: AppTextStyles.regular13(context).copyWith(
            //     color:  containerISSelected==true?AppColors.white:AppColors.c959895
            // )),
            // SpaceWidget(height: 10,),
            // Text('chef email: ${systemMeals.chefId!.email!}',style: AppTextStyles.regular13(context).copyWith(
            //     color:  containerISSelected==true?AppColors.white:AppColors.c959895
            // )),
            // SpaceWidget(height: 10,),
            // Text('chef id: ${systemMeals.chefId!.id!}',style: AppTextStyles.regular13(context).copyWith(
            //     color:  containerISSelected==true?AppColors.white:AppColors.c959895
            // )),
            // SpaceWidget(height: 5,),
            // Text('meal status: ${systemMeals.status!}',style: AppTextStyles.regular13(context).copyWith(
            //     color: containerISSelected==true?AppColors.white:AppColors.primaryColor
            // ))
          ],
        ),
      ),
    );
  }
}
