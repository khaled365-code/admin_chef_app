

import 'package:admin_chef_app/core/database/api/api_consumer.dart';
import 'package:admin_chef_app/core/database/api/end_points.dart';
import 'package:admin_chef_app/core/database/errors/error_model.dart';
import 'package:admin_chef_app/core/database/errors/server_exception.dart';
import 'package:admin_chef_app/features/main_dashboard/data/models/all_system_meals_model/all_system_meals_model.dart';
import 'package:admin_chef_app/features/main_dashboard/data/repos/dashboard_repo.dart';
import 'package:dartz/dartz.dart';

class DashBoardRepoImplementation implements DashBoardRepo
{

  final ApiConsumer api;

  DashBoardRepoImplementation({required this.api});

  @override
  Future<Either<ErrorModel, AllSystemMealsModel>> getAllSystemMeals() async {
     
    try{
      final response=await api.get(EndPoints.getAllMealsEndPoint);
      AllSystemMealsModel allSystemMealsModel=AllSystemMealsModel.fromJson(response);
      return Right(allSystemMealsModel);

    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }




}