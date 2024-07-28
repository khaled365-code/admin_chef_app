

import 'package:admin_chef_app/core/database/errors/error_model.dart';
import 'package:admin_chef_app/features/main_dashboard/data/models/all_system_meals_model/all_system_meals_model.dart';
import 'package:dartz/dartz.dart';

abstract class DashBoardRepo
{
  Future<Either<ErrorModel,AllSystemMealsModel>>getAllSystemMeals();

}