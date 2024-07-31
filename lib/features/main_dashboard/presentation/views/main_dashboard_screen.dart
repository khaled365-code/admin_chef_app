

import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/chef_data_container.dart';
import '../widgets/chef_request_widget.dart';
import '../widgets/chef_shimmer_container.dart';
import '../widgets/delete_chef_widget.dart';
import '../widgets/delete_meal_widget.dart';
import '../widgets/logout_design_widget.dart';
import '../widgets/meal_container_item.dart';
import '../widgets/banner_container_widget.dart';
import '../widgets/custom_dashboard_drawer.dart';
import '../widgets/dashboard_app_bar.dart';
import '../widgets/meal_request_widget.dart';
import '../widgets/meal_shimmer_container.dart';
import '../widgets/offers_and_categories_section.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return Scaffold(
      backgroundColor: AppColors.cFCF6EE,
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: DashboardAppBar(),
          ),
          SliverFillRemaining(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                          child: CustomDashboardDrawer()),
                      Container(
                        color: AppColors.cFCF6EE,
                        width: 40.w,
                      ),
                      Expanded(
                        flex: 5,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 70.h),
                                  child: BannerContainerWidget(),
                                ),
                                BlocBuilder<MainDashboardCubit, MainDashboardState>(
                                  builder: (context, state)
                                {
                                  if(state is GetAllChefsLoadingState)
                                   {
                                     return Container(
                                           decoration: BoxDecoration(
                                             color: AppColors.cFCF6EE,
                                             borderRadius: BorderRadius.circular(24),
                                           ),
                                           child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 SpaceWidget(height: 72,),
                                                 Text('Please wait',
                                                   style: AppTextStyles.bold23(context).copyWith(
                                                       color: AppColors.c07143B
                                                   ),),
                                                 SpaceWidget(height: 64,),
                                                 GridView.builder(
                                                   shrinkWrap: true,
                                                   physics: NeverScrollableScrollPhysics(),
                                                   itemCount: 10,
                                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                     crossAxisCount: 2,
                                                     crossAxisSpacing: 40,
                                                     mainAxisSpacing: 40,
                                                     mainAxisExtent: 290,
                                                   ),
                                                   itemBuilder: (context, index) =>
                                                       ChefShimmerContainer(),),
                                                 SpaceWidget(height: 72,),
                                               ])

                                       );
                                   }
                                  if(MainDashboardCubit.get(context).allChefsData!=null)
                                    {

                                      return Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.cFCF6EE,
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SpaceWidget(height: 72,),
                                                Text('All Chefs',
                                                  style: AppTextStyles.bold23(context).copyWith(
                                                      color: AppColors.c07143B
                                                  ),),
                                                SpaceWidget(height: 64,),
                                                GridView.builder(
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: MainDashboardCubit.get(context).allChefsData!.chefs!.length,
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 25,
                                                    mainAxisSpacing: 40,
                                                    mainAxisExtent: 300,
                                                  ),
                                                  itemBuilder: (context, index) =>
                                                  ChefDataContainer(
                                                    chefsData: MainDashboardCubit.get(context).allChefsData!.chefs![index],
                                                  )),
                                                SpaceWidget(height: 72,),



                                              ])

                                      );
                                    }
                                  if(state is GetAllMealsLoadingState)
                                    {
                                      return Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.cFCF6EE,
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SpaceWidget(height: 72,),
                                                Text('Please wait',
                                                  style: AppTextStyles.bold23(context).copyWith(
                                                      color: AppColors.c07143B
                                                  ),),
                                                SpaceWidget(height: 200,),
                                                GridView.builder(
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: 10,
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 50,
                                                    mainAxisSpacing: 110,
                                                    mainAxisExtent: 300,
                                                  ),
                                                  itemBuilder: (context, index) =>
                                                      MealShimmerContainer(),),
                                                SpaceWidget(height: 72,),



                                              ])

                                      );
                                    }
                                  if(MainDashboardCubit.get(context).allSystemMealsModel!=null)
                                    {
                                      return Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.cFCF6EE,
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SpaceWidget(height: 72,),
                                                Text('All Meals',
                                                  style: AppTextStyles.bold23(context).copyWith(
                                                      color: AppColors.c07143B
                                                  ),),
                                                SpaceWidget(height: 200,),
                                                GridView.builder(
                                                  padding: EdgeInsetsDirectional.zero,
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: MainDashboardCubit.get(context).allSystemMealsModel!.meals!.length,
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 50,
                                                    mainAxisSpacing: 110,
                                                    mainAxisExtent: 300,
                                                  ),
                                                  itemBuilder: (context, index) =>
                                                      GestureDetector(
                                                        onTap: ()
                                                        {
                                                          MainDashboardCubit.get(context).updateSelectedMeal(index: index);
                                                        },
                                                        child: MealContainerItem(
                                                          mealImage: MainDashboardCubit.get(context).mealsImages[index],
                                                          containerISSelected: MainDashboardCubit.get(context).currentMealIndex==index,
                                                          systemMeals:MainDashboardCubit.get(context).allSystemMealsModel!.meals![index],
                                                        ),
                                                      ),),
                                                SpaceWidget(height: 72,),



                                              ])

                                      );
                                    }
                                  if(state is PerformChefRequestDesignState ||
                                      state is DealWithChefRequestFailureState ||
                                      state is DealWithChefRequestSuccessState || state is DealWithChefRequestLoadingState)
                                    {
                                      return ChefRequestWidget();
                                    }
                                  if(state is PerformMealRequestDesignState ||
                                      state is DealWithMealRequestLoadingState ||
                                      state is DealWithMealRequestFailureState || state is DealWithMealRequestSuccessState)
                                  {
                                    return MealRequestWidget();
                                  }
                                  if(state is GetDeleteMealDesignState ||
                                      state is DeleteMealLoadingState ||
                                      state is DeleteMealFailureState ||
                                      state is DeleteMealSuccessState)
                                    {
                                      return DeleteMealWidget();
                                    }
                                  if(state is GetDeleteChefDesignState ||
                                      state is DeleteChefLoadingState ||
                                      state is DeleteChefFailureState ||
                                      state is DeleteChefSuccessState)
                                  {
                                    return DeleteChefWidget();
                                  }
                                  if(state is GetLogoutDesignState ||
                                      state is AdminLogoutFailureState ||
                                      state is AdminLogoutSuccessState ||
                                      state is AdminLogoutLoadingState)
                                  {
                                    return LogoutDesignWidget();
                                  }
                                  else
                                    {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:
                                        [
                                          SpaceWidget(height: 72),
                                          RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: 'Welcome ',
                                              style: AppTextStyles.bold23(context)
                                                  .copyWith(
                                                      color: AppColors.c07143B)),
                                          TextSpan(
                                              text: '🙂',
                                              style: AppTextStyles.bold23(context)
                                                  .copyWith(
                                                      color:
                                                          AppColors.primaryColor))
                                        ]))
                                      ],
                                      );
                                    }
                                },)

                              ],
                            ),
                          )),
                      Container(
                        width: 40.w,
                        color: AppColors.cFCF6EE,
                      ),
                      Expanded(
                          flex: 3,
                          child:OffersAndCategoriesSection()),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      )),
    );
  }
}


