

import 'package:flutter/material.dart';

import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../data/models/categories_data_model.dart';

class CategoryContainerItem extends StatelessWidget {
  const CategoryContainerItem({super.key, required this.categoriesDataModel, required this.itemIsSelected});

  final CategoriesDataModel categoriesDataModel;
  final bool itemIsSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: itemIsSelected==true? AppColors.primaryColor :AppColors.transparent,
        borderRadius: BorderRadius.circular(100),
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
