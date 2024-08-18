

import 'package:flutter/material.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
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
          const SpaceWidget(height: 52,),
          Image.asset(
            ImageConstants.dishes4Image,
          ),
          const SpaceWidget(height: 52)
        ],
      ),
    );
  }
}
