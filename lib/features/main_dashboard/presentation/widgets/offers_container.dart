
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class OffersContainer extends StatelessWidget {
  const OffersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
            aspectRatio: 581/315,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.white.withOpacity(.4)
              ),
              child: Padding(
                padding:  EdgeInsetsDirectional.only(bottom: 24.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('Our Perfect Meals',
                            style: AppTextStyles.bold18(context)
                                .copyWith(color: AppColors.c07143B)),
                      ),
                      const SpaceWidget(height: 18,),
                      Text('The home of your stomach',
                          style: AppTextStyles.semiBold14(context)
                              .copyWith(color: AppColors.c959895)),
                    ]
                ),
              ),
            )),
        PositionedDirectional(
            top: -170.0.h,
            start: 91.w,
            end: 91.w,
            child: Image.asset(ImageConstants.bigBurgerImage,width: 399.w,fit: BoxFit.contain,))
      ],
    );
  }
}
