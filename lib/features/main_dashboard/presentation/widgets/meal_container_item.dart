

import 'package:admin_chef_app/core/utillis/app_assets.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../data/models/all_system_meals_model/meals.dart';

class MealContainerItem extends StatelessWidget {
  const MealContainerItem({super.key, required this.systemMeals, required this.containerISSelected, required this.mealImage,});

  final SystemMeals systemMeals;
  final bool containerISSelected;
  final String mealImage;
  @override
  Widget build(BuildContext context) {

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: containerISSelected==true?AppColors.primaryColor:AppColors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpaceWidget(height: 280,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(systemMeals.name!,style: AppTextStyles.semiBold16(context).copyWith(
                      color: containerISSelected==true?AppColors.white:AppColors.c07143B
                  )),
                ),
                SpaceWidget(height: 8,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(systemMeals.description!,style: AppTextStyles.regular13(context).copyWith(
                      color: containerISSelected==true?AppColors.white:AppColors.c959895
                  )),
                ),
                SpaceWidget(height: 24,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('Id :${systemMeals.id!}',style: AppTextStyles.regular13(context).copyWith(
                      color: containerISSelected==true?AppColors.white:AppColors.cEA6A12
                  )),
                ),
                SpaceWidget(height: 8,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('status : ${systemMeals.status!} Meal',style: AppTextStyles.regular13(context).copyWith(
                      color:  containerISSelected==true?AppColors.white:AppColors.primaryColor
                  )),
                ),
                // SpaceWidget(height: 24,),
                // FittedBox(
                //   fit: BoxFit.scaleDown,
                //   child: Text('${systemMeals.chefId!.name!}',style: AppTextStyles.semiBold14(context).copyWith(
                //       color:  containerISSelected==true?AppColors.white:AppColors.c959895
                //   )),
                // ),
                // SpaceWidget(height: 3,),
                // FittedBox(
                //   fit: BoxFit.scaleDown,
                //   child: Text('${systemMeals.chefId!.email!}',style: AppTextStyles.regular10(context).copyWith(
                //       color:  containerISSelected==true?AppColors.white:AppColors.c959895
                //   )),
                // ),
                // SpaceWidget(height: 3,),
                // FittedBox(
                //   fit: BoxFit.scaleDown,
                //   child: Text('+2${systemMeals.chefId!.phone!}',style: AppTextStyles.regular10(context).copyWith(
                //       color:  containerISSelected==true?AppColors.white:AppColors.c959895
                //   )),
                // ),
                // SpaceWidget(height: 3,),
                // FittedBox(
                //   fit: BoxFit.scaleDown,
                //   child: Text('${systemMeals.chefId!.id!}',style: AppTextStyles.regular10(context).copyWith(
                //       color:  containerISSelected==true?AppColors.white:AppColors.c959895
                //   )),
                // ),
                // Text('${systemMeals.status!} Meal',style: AppTextStyles.semiBold14(context).copyWith(
                //     color:  containerISSelected==true?AppColors.white:AppColors.primaryColor
                // )),
                 Spacer(),
                Row(
                  children: [
                    Text('chef details',style: AppTextStyles.regular15(context).copyWith(
                        color:  containerISSelected==true?AppColors.white:AppColors.primaryColor
                    )),
                    Spacer(),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color:  containerISSelected==true?AppColors.white:AppColors.primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset(ImageConstants.viewAllNextIcon,colorFilter: ColorFilter.mode(containerISSelected==true?AppColors.primaryColor:AppColors.white, BlendMode.srcIn),),
                      ),
                    )
                  ],
                ),
                SpaceWidget(height: 96,),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: -70,
          start: 70,
          end: 70,
          child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(mealImage),fit: BoxFit.cover,),
              ),
            ),
        )
      ],
    );

  }
}
