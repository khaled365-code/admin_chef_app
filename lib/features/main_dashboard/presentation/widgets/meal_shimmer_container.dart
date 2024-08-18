

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class MealShimmerContainer extends StatelessWidget {
  const MealShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SpaceWidget(height: 280,),
                Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    child: Text('Meal Name',style: AppTextStyles.semiBold16(context).copyWith(
                    )),
                  ),
                ),
                const SpaceWidget(height: 8,),
                Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    child: Text('Meal description',style: AppTextStyles.regular13(context).copyWith(
                    )),
                  ),
                ),
                const SpaceWidget(height: 24,),
                Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    child: Text('Meal id',style: AppTextStyles.regular13(context).copyWith(
                    )),
                  ),
                ),
                const SpaceWidget(height: 8,),
                Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    child: Text('Meal status',style: AppTextStyles.regular13(context).copyWith(
                    )),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppColors.white,
                      highlightColor: AppColors.cD1D8E0,
                      child: Container(
                        child: Text('chef details',style: AppTextStyles.regular15(context).copyWith()),
                      ),
                    ),
                    const Spacer(),
                    Shimmer.fromColors(
                      baseColor: AppColors.white,
                      highlightColor: AppColors.cD1D8E0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(ImageConstants.viewAllNextIcon,),
                        ),
                      ),
                    )
                  ],
                ),
                const SpaceWidget(height: 96,),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: -70,
          start: 70,
          end: 70,
          child: Shimmer.fromColors(
            baseColor: AppColors.white,
            highlightColor: AppColors.cD1D8E0,
            child: Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(ImageConstants.cartImage1),fit: BoxFit.cover,),
              ),
            ),
          ),
        )
      ],
    );
  }
}
