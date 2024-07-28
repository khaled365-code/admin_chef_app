


import 'package:admin_chef_app/core/utillis/app_assets.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

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
            image: DecorationImage(
                image: AssetImage(
                  ImageConstants.bannerImage,)),
        ),
          child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 82,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
            Text('Hello, Anas Mohamed',style: AppTextStyles.bold23(context).copyWith(
            color: AppColors.c07143B
          )),
              SpaceWidget(height: 20,),
              RichText(text: TextSpan(
                children: [
                      TextSpan(
                          text: 'Get ',
                          style: AppTextStyles.semiBold16(context)
                              .copyWith(color: AppColors.c959895)),
                      TextSpan(
                          text: 'Full control ',
                          style: AppTextStyles.semiBold16(context)
                              .copyWith(color: AppColors.primaryColor)),
                      TextSpan(
                          text: 'on chef app',
                          style: AppTextStyles.semiBold16(context)
                              .copyWith(color: AppColors.c959895))
                    ],
              )),
              SpaceWidget(height: 20,),
              ElevatedButton(
                  onPressed: (){},
                  child: Center(child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Check Meals',style: AppTextStyles.regular16(context).copyWith(
                      color: AppColors.white,
                      fontFamily: 'Poppins',
                    ),),
                  )),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  fixedSize: Size(150, 48),
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
              Spacer(),


            ]))
      ),
    );
  }
}
