import 'package:admin_chef_app/core/utillis/app_styles.dart';
import 'package:admin_chef_app/features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utillis/app_colors.dart';
import '../../../../core/widgets/space_widget.dart';
import 'meal_container_item.dart';


// class ShowMealsContainer extends StatelessWidget {
//   const ShowMealsContainer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MainDashboardCubit, MainDashboardState>(
//       builder: (context, state) {
//         return Container(
//             decoration: BoxDecoration(
//               color: AppColors.cFCF6EE,
//               borderRadius: BorderRadius.circular(24),
//             ),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SpaceWidget(height: 24,),
//                   Text('Trending Orders',
//                     style: AppTextStyles.bold23(context).copyWith(
//                         color: AppColors.c07143B
//                     ),),
//                   SpaceWidget(height: 64,),
//                   state is GetAllMealsSuccessState?
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 40,
//                         mainAxisSpacing: 40,
//                         mainAxisExtent: 237
//                     ),
//                     itemBuilder: (context, index) =>
//                         MealContainerItem(
//                           systemMeals: state.allSystemMealsModel.meals![index],
//                         ),):SizedBox.shrink()
//
//
//                 ])
//
//         );
//       },
//     );
//   }
// }
