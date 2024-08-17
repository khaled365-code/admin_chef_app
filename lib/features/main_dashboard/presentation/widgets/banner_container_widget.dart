


import 'package:admin_chef_app/core/database/api/api_keys.dart';
import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:admin_chef_app/core/utillis/app_assets.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';

class BannerContainerWidget extends StatelessWidget {
  const BannerContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1099/390,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
                image: AssetImage(
                  ImageConstants.bannerImage,)),
        ),
          child: Padding(
          padding:  EdgeInsetsDirectional.only(start: 82.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text('Hello, ${CacheHelper().getData(key: ApiKeys.name)}',
                        style: AppTextStyles.bold23(context).copyWith(color: AppColors.c07143B)),
              SpaceWidget(height: 24,),
              RichText(text: TextSpan(
                children: [
                      TextSpan(
                          text: 'Get ',
                          style: AppTextStyles.semiBold14(context)
                              .copyWith(color: AppColors.c959895)),
                      TextSpan(
                          text: 'Full control ',
                          style: AppTextStyles.semiBold14(context)
                              .copyWith(color: AppColors.primaryColor)),
                      TextSpan(
                          text: 'on chef app',
                          style: AppTextStyles.semiBold14(context)
                              .copyWith(color: AppColors.c959895))
                    ],
              )),
              SpaceWidget(height: 24,),
              ElevatedButton(
                  onPressed: (){
                    MainDashboardCubit.get(context).allChefsData=null;
                    MainDashboardCubit.get(context).getAllMealsFun();
                  },
                  child: Center(
                      child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Check Meals',style: AppTextStyles.regular16(context).copyWith(
                      color: AppColors.white,
                      fontFamily: 'Poppins',
                    ),),
                  )),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  fixedSize: Size(150.w, 48.h),
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
              Spacer(),


            ]))
      ),
    );
  }
}
