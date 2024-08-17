

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
    return Container(
      color: AppColors.cFFF6EE,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceWidget(height: 52,),
          Image.asset(
            ImageConstants.dishes4Image,
          ),
          SpaceWidget(height: 52)
        ],
      ),
    );
  }
}
