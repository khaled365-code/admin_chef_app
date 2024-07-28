
import 'package:flutter/material.dart';

import '../../../../core/utillis/app_assets.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
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
                padding: const EdgeInsetsDirectional.only(bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('Our Perfect 100 % Meals',
                            style: AppTextStyles.bold18(context)
                                .copyWith(color: AppColors.c07143B)),
                      ),
                      SpaceWidget(height: 18,),
                      Text('The home of your stomach',
                          style: AppTextStyles.semiBold14(context)
                              .copyWith(color: AppColors.c959895)),
                    ]
                ),
              ),
            )),
        PositionedDirectional(
            bottom: 50,
            start: 91,
            end: 91,
            child: Image.asset(ImageConstants.bigBurgerImage,width: 299,height: 295,))
      ],
    );
  }
}
