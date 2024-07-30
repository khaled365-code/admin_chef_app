import 'package:admin_chef_app/core/utillis/app_assets.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/widgets/text_categories_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import 'category_container_item.dart';
import 'offers_container.dart';

class OffersAndCategoriesSection extends StatelessWidget {
  const OffersAndCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          color: AppColors.cFCF6EE,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                SpaceWidget(height: 145,),
                Padding(
                  padding:  EdgeInsetsDirectional.only(end: 40.w),
                  child: OffersContainer(),
                ),
                SpaceWidget(height: 48,),
                Padding(
                  padding:  EdgeInsetsDirectional.only(end: 40.w),
                  child: TextCategoriesContainer(),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image.asset(ImageConstants.rightBurgerImage),
                ),

              ],
            ),
          ),
        );
  }
}
