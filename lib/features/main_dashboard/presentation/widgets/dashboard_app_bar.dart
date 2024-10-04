

import 'package:admin_chef_app/core/database/api/api_keys.dart';
import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 30.w,top: 7.h,bottom: 7.h),
                child: Image.asset(ImageConstants.adminLogoAImage),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.cFFF3EB,
                  shape: BoxShape.circle
                ),
                child: Image.asset(ImageConstants.adminImage),
              ),
              const SpaceWidget(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CacheHelper().getData(key: ApiKeys.name),style: AppTextStyles.regular13(context).copyWith(
                      fontFamily: 'Poppins',
                      color: AppColors.c07143B
                  ),),
                  Text('App Administrator',style: AppTextStyles.regular10(context).copyWith(
                      fontFamily: 'Poppins',
                      color: AppColors.c07143B
                  ),),

                ],
              ),
              const SpaceWidget(width: 32,),
            ],
          ),
          const SpaceWidget(height: 15,),
        ],
      ),
    );
  }
}