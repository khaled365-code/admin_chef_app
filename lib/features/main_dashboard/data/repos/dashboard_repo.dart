

import 'package:admin_chef_app/core/database/errors/error_model.dart';
import 'package:admin_chef_app/features/main_dashboard/data/models/all_system_meals_model/all_system_meals_model.dart';
import 'package:dartz/dartz.dart';

import '../models/chefs_data/all_chefs_data_model.dart';

abstract class DashBoardRepo
{
  Future<Either<ErrorModel,AllSystemMealsModel>>getAllSystemMeals();
  Future<Either<ErrorModel,AllChefsDataModel>>getAllSystemChefs();
  Future<Either<ErrorModel,String>>dealWithChefRequest({required String chefId,required String status});
  Future<Either<ErrorModel,String>>dealWithMealRequest({required String mealId,required String status});


}