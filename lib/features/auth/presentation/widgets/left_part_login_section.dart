

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utillis/app_assets.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class ImageAdminLoginSection extends StatelessWidget {
  const ImageAdminLoginSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: AppColors.cFFF6EE,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceWidget(
                height: 52,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    ImageConstants.admin3ItemsLogoIcon,
                  ),
                  SpaceWidget(width: 19),
                  Text(
                    'Chef & APP',
                    style: AppTextStyles.semiBold25(context)
                        .copyWith(color: AppColors.black),
                  ),
                  Spacer(),
                ],
              ),
              AspectRatio(
                aspectRatio: 763 / 865,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.cFFF6EE,
                  ),
                  child: Image.asset(
                    ImageConstants.dishes4Image,
                  ),
                ),
              ),
              SpaceWidget(height: 41)
            ],
          ),
        ));
  }
}
