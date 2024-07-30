import 'package:admin_chef_app/core/utillis/app_colors.dart';
import 'package:admin_chef_app/core/utillis/app_styles.dart';
import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utillis/app_assets.dart';
import 'category_container_item.dart';

class TextCategoriesContainer extends StatelessWidget {
  const TextCategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainDashboardCubit, MainDashboardState>(
      builder: (context, state) {
        var mainDashboardCubit = BlocProvider.of<MainDashboardCubit>(context);
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(.6),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceWidget(height: 24,),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 24.w),
                child: Text('Categories',
                  style: AppTextStyles.bold16(context).copyWith(
                      color: AppColors.c07143B,
                  ),)),
              SpaceWidget(height: 43,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: Divider(
                  color: AppColors.cE9ECEF,
                  thickness: 2,
                ),
              ),
              SpaceWidget(height: 43,),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: mainDashboardCubit.categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 32,
                    crossAxisCount: 3,
                    mainAxisExtent: 48),
                padding:  EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                itemBuilder: (context, index) =>
                    GestureDetector(
                      onTap: () {
                        mainDashboardCubit
                          ..updateSelectedCategoryIndex(currentIndex: index);
                      },
                      child: CategoryContainerItem(
                        itemIsSelected: mainDashboardCubit
                            .selectedCategoryIndex == index,
                        categoriesDataModel: mainDashboardCubit
                            .categoriesList[index],
                      ),
                    ),),
              SpaceWidget(height: 43,),


            ],
          ),
        );
      },
    );
  }
}
