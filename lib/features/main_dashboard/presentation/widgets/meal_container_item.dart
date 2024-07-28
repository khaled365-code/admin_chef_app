

import 'package:admin_chef_app/core/utillis/app_assets.dart';
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
        padding: const EdgeInsetsDirectional.only(top: 24,start: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text('Id : ${systemMeals.id!}',style: AppTextStyles.regular13(context).copyWith(
                  color: containerISSelected==true?AppColors.white:AppColors.cEA6A12
              )),
            ),
           SpaceWidget(height: 10,),
           Text(systemMeals.name!,style: AppTextStyles.semiBold14(context).copyWith(
           color: containerISSelected==true?AppColors.white:AppColors.c07143B
           )),
            SpaceWidget(height: 10,),
            Text(systemMeals.description!,style: AppTextStyles.regular13(context).copyWith(
                color: containerISSelected==true?AppColors.white:AppColors.c959895
            )),
            SpaceWidget(height: 10,),
            IntrinsicHeight(
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 91,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage(ImageConstants.chefBigImage,),fit: BoxFit.fill),
                    color: AppColors.white
                    )
                  ),
                  SpaceWidget(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpaceWidget(height: 8,),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('${systemMeals.chefId!.name!}',style: AppTextStyles.semiBold14(context).copyWith(
                            color:  containerISSelected==true?AppColors.white:AppColors.c959895
                        )),
                      ),
                      SpaceWidget(height: 3,),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('${systemMeals.chefId!.email!}',style: AppTextStyles.regular10(context).copyWith(
                            color:  containerISSelected==true?AppColors.white:AppColors.c959895
                        )),
                      ),
                      SpaceWidget(height: 3,),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('+2${systemMeals.chefId!.phone!}',style: AppTextStyles.regular10(context).copyWith(
                            color:  containerISSelected==true?AppColors.white:AppColors.c959895
                        )),
                      ),
                      SpaceWidget(height: 3,),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('${systemMeals.chefId!.id!}',style: AppTextStyles.regular10(context).copyWith(
                            color:  containerISSelected==true?AppColors.white:AppColors.c959895
                        )),
                      ),

                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Text('${systemMeals.status!} Meal',style: AppTextStyles.semiBold14(context).copyWith(
                color:  containerISSelected==true?AppColors.white:AppColors.primaryColor
            )),
            SpaceWidget(height: 24,),
          ],
        ),
      ),
    );
  }
}
