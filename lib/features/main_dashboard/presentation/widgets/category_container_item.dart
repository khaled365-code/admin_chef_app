

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/categories_data_model.dart';

class CategoryContainerItem extends StatelessWidget {
  const CategoryContainerItem({super.key, required this.categoriesDataModel, required this.itemIsSelected});

  final CategoriesDataModel categoriesDataModel;
  final bool itemIsSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w,vertical: 10.h),
      decoration: BoxDecoration(
        color: itemIsSelected==true? AppColors.primaryColor :AppColors.transparent,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: AppColors.primaryColor)
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(categoriesDataModel.categoryName,style: AppTextStyles.regular10(context).copyWith(
          color: itemIsSelected==true? AppColors.white:AppColors.primaryColor,fontFamily: 'Poppins'
        ),),
      ),
    );
  }
}
