

import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../data/models/all_system_meals_model/meals.dart';

class MealContainerItem extends StatelessWidget {
  const MealContainerItem({super.key, required this.systemMeals, required this.containerISSelected,});

  final SystemMeals systemMeals;
  final bool containerISSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerISSelected==true?AppColors.primaryColor:AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 24,start: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text('meal id: ${systemMeals.id!}',style: AppTextStyles.regular13(context).copyWith(
                  color: containerISSelected==true?AppColors.white:AppColors.cEA6A12
              )),
            ),
           SpaceWidget(height: 10,),
           Text(systemMeals.name!,style: AppTextStyles.semiBold16(context).copyWith(
           color: containerISSelected==true?AppColors.white:AppColors.c07143B
           )),
            SpaceWidget(height: 10,),
            Text(systemMeals.description!,style: AppTextStyles.regular13(context).copyWith(
                color: containerISSelected==true?AppColors.white:AppColors.c959895
            )),
            SpaceWidget(height: 10,),
            Text('chef name: ${systemMeals.chefId!.name!}',style: AppTextStyles.regular13(context).copyWith(
                color:  containerISSelected==true?AppColors.white:AppColors.c959895
            )),
            SpaceWidget(height: 10,),
            Text('chef email: ${systemMeals.chefId!.email!}',style: AppTextStyles.regular13(context).copyWith(
                color:  containerISSelected==true?AppColors.white:AppColors.c959895
            )),
            SpaceWidget(height: 10,),
            Text('chef id: ${systemMeals.chefId!.id!}',style: AppTextStyles.regular13(context).copyWith(
                color:  containerISSelected==true?AppColors.white:AppColors.c959895
            )),
            SpaceWidget(height: 5,),
            Text('meal status: ${systemMeals.status!}',style: AppTextStyles.regular13(context).copyWith(
                color: containerISSelected==true?AppColors.white:AppColors.primaryColor
            ))
          ],
        ),
      ),
    );
  }
}
