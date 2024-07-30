

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utillis/app_assets.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class ChefShimmerContainer extends StatelessWidget {
  const ChefShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
              color: AppColors.cF3F4F6
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpaceWidget(height: 60,),
          Shimmer.fromColors(
            baseColor: AppColors.white,
            highlightColor: AppColors.cD1D8E0,
            child: Container(
              width: 113,
              height: 113,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(ImageConstants.chefBigImage),fit: BoxFit.fill)
              ),
            ),
          ),
          SpaceWidget(height: 40,),
          Shimmer.fromColors(
            baseColor: AppColors.white,
            highlightColor: AppColors.cD1D8E0,
            child: Container(
              child: Text('Chef Name',style: AppTextStyles.semiBold14(context).copyWith(
                  color: AppColors.c898E99
              ),),
            ),
          ),
          SpaceWidget(height: 10,),
          Shimmer.fromColors(
            baseColor: AppColors.white,
            highlightColor: AppColors.cD1D8E0,
            child: Container(
              child: Text('Chef Email',style: AppTextStyles.regular10(context).copyWith(
                  color: AppColors.c898E99
              ),),
            ),
          ),
          SpaceWidget(height: 10,),
          Shimmer.fromColors(
            baseColor: AppColors.white,
            highlightColor: AppColors.cD1D8E0,
            child: Container(
              child: Text('Chef Phone',style: AppTextStyles.regular10(context).copyWith(
                  color: AppColors.c898E99
              ),),
            ),
          ),
          SpaceWidget(height: 10,),
          Shimmer.fromColors(
            baseColor: AppColors.white,
            highlightColor: AppColors.cD1D8E0,
            child: Container(
              child: Text('Chef id',style: AppTextStyles.regular10(context).copyWith(
                  color: AppColors.c898E99
              ),),
            ),
          ),
          SpaceWidget(height: 10,),
          Shimmer.fromColors(
            baseColor: AppColors.white,
            highlightColor: AppColors.cD1D8E0,
            child: Container(
              child: Text('Chef Status',style: AppTextStyles.regular10(context).copyWith(
                  color: AppColors.c898E99
              ),),
            ),
          ),





        ],
      ),
    );
  }
}