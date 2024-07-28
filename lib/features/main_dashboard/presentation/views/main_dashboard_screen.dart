

import 'package:admin_chef_app/core/utillis/app_assets.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/widgets/meal_shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utillis/app_colors.dart';
import '../../../../core/utillis/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/meal_container_item.dart';
import '../widgets/banner_container_widget.dart';
import '../widgets/custom_dashboard_drawer.dart';
import '../widgets/dashboard_app_bar.dart';
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
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                      child: CustomDashboardDrawer()),
                  Container(
                    color: AppColors.cFCF6EE,
                    width: 40,
                  ),
                  Expanded(
                    flex: 5,
                      child: SingleChildScrollView(
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: BannerContainerWidget(),
                            ),
                            BlocBuilder<MainDashboardCubit, MainDashboardState>(
                              builder: (context, state)
                            {
                              return state is GetAllMealsLoadingState?
                              Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.cFCF6EE,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SpaceWidget(height: 24,),
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
                                             MealShimmerContainer(),)


                                      ])

                              ):
                              MainDashboardCubit.get(context).allSystemMealsModel!=null?
                              Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.cFCF6EE,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SpaceWidget(height: 24,),
                                        Text('All Meals',
                                          style: AppTextStyles.bold23(context).copyWith(
                                              color: AppColors.c07143B
                                          ),),
                                        SpaceWidget(height: 64,),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: MainDashboardCubit.get(context).allSystemMealsModel!.meals!.length,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 40,
                                            mainAxisSpacing: 40,
                                            mainAxisExtent: 290,
                                          ),
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                                onTap: ()
                                                {
                                                  MainDashboardCubit.get(context).updateSelectedMeal(index: index);
                                                },
                                                child: MealContainerItem(
                                                  containerISSelected: MainDashboardCubit.get(context).currentMealIndex==index,
                                                  systemMeals:MainDashboardCubit.get(context).allSystemMealsModel!.meals![index],
                                                ),
                                              ),),
                                        SpaceWidget(height: 64,),



                                      ])

                              ) :
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  SpaceWidget(height: 24,),
                                  Text('Main Dashboard',
                                    style: AppTextStyles.bold23(context).copyWith(
                                        color: AppColors.c07143B
                                    ),),

                                ],
                              );
                            },)

                          ],
                        )
                      )),
                  Container(
                    width: 40,
                    color: AppColors.cFCF6EE,
                  ),
                  Expanded(
                      flex: 3,
                      child:OffersAndCategoriesSection()),
                ],
              ),
            ),
          ),

        ],
      )),
    );
  }
}


