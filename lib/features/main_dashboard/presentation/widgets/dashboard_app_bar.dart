

import 'package:flutter/material.dart';

import '../../../../core/utillis/app_assets.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 30,top: 7,bottom: 7),
            child: Image.asset(ImageConstants.adminLogoAImage),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 16,bottom: 16),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.adminImage))
              ),
            ),
          ),
          SpaceWidget(width: 16,),
          Padding(
            padding: const EdgeInsets.only(top: 16,bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Anas Mohamed',style: AppTextStyles.regular16(context).copyWith(
                    fontFamily: 'Poppins',
                    color: AppColors.c07143B
                ),),
                Text('App Adminstrator',style: AppTextStyles.regular16(context).copyWith(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: AppColors.c07143B
                ),),

              ],
            ),
          ),
          SpaceWidget(width: 32,),
        ],
      ),
    );
  }
}