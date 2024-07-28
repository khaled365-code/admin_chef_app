import 'package:admin_chef_app/core/widgets/space_widget.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utillis/app_colors.dart';
import 'drawer_list_tile.dart';

class CustomDashboardDrawer extends StatelessWidget {
  const CustomDashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainDashboardCubit, MainDashboardState>(
      builder: (context, state) {
        var mainDashboardCubit = BlocProvider.of<MainDashboardCubit>(context);
        return Container(
            color: AppColors.white,
            child: Column(
              children: [
                Divider(
                  color: AppColors.cE9ECEF,
                  height: 10,
                ),
                SpaceWidget(height: 24,),
                ...List.generate(mainDashboardCubit.firstDrawerDataList.length, (index) => Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10,start: 34),
                  child: DrawerListTile(
                    onListTileTap: ()
                      {
                        mainDashboardCubit.updateFirstDrawerListShape(currentIndex: index);
                        switch(index)
                        {
                          case 0:
                            MainDashboardCubit.get(context).allSystemMealsModel=null;
                            MainDashboardCubit.get(context).allChefsData=null;
                            break;
                          case 1:
                            MainDashboardCubit.get(context).allChefsData=null;
                            mainDashboardCubit.getAllMealsFun();
                            break;
                          case 2:
                            MainDashboardCubit.get(context).allSystemMealsModel=null;
                            MainDashboardCubit.get(context).getAllSystemChefsFun();
                            break;
                          case 3:
                            MainDashboardCubit.get(context).allSystemMealsModel=null;
                            MainDashboardCubit.get(context).allChefsData=null;
                            MainDashboardCubit.get(context).getChefRequestDesign();
                          case 4:
                            MainDashboardCubit.get(context).allSystemMealsModel=null;
                            MainDashboardCubit.get(context).allChefsData=null;
                            MainDashboardCubit.get(context).getMealRequestDesign();


                        }
                      },
                      drawerDataModel: mainDashboardCubit.firstDrawerDataList[index]),
                ),),
                Spacer(),
                ...List.generate(
                    mainDashboardCubit.secondDrawerDataList.length,
                    (index) => Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 10,start: 34),
                      child: DrawerListTile(
                        drawerDataModel: mainDashboardCubit.secondDrawerDataList[index],
                        onListTileTap: ()
                        {
                          mainDashboardCubit.updateSecondDrawerListShape(currentIndex: index);
                        },
                      ),
                    ),),
                SpaceWidget(height: 14,),


              ],
            )

        );
      },
    );
  }
}
