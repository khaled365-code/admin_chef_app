import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'category_container_item.dart';

class TextCategoriesContainer extends StatelessWidget {
  const TextCategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(.6),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceWidget(height: 24,),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w),
                child: Text('Categories',
                  style: AppTextStyles.bold16(context).copyWith(
                      color: AppColors.c07143B,
                  ),)),
              const SpaceWidget(height: 43,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: const Divider(
                  color: AppColors.cE3E1E1,
                  thickness: 1,
                ),
              ),
              const SpaceWidget(height: 43,),
              BlocBuilder<CategoriesCubit,CategoriesState>(
                  builder: (context,state)
                  {
                    return  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: CategoriesCubit.get(context).categoriesList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio:150/48 ,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 32,
                        crossAxisCount: 3,),
                      padding:  EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                      itemBuilder: (context, index) =>
                          GestureDetector(
                            onTap: ()
                            {
                              CategoriesCubit.get(context).updateSelectedCategoryIndex(currentIndex: index);
                            },
                            child: CategoryContainerItem(
                              itemIsSelected: CategoriesCubit.get(context).selectedCategoryIndex == index,
                              categoriesDataModel: CategoriesCubit.get(context).categoriesList[index],
                            ),
                          ),);
                  }),
              const SpaceWidget(height: 43,),
            ],
          ),
        );
  }
}
