

import 'package:admin_chef_app/core/database/api/api_consumer.dart';
import 'package:admin_chef_app/core/database/api/api_keys.dart';
import 'package:admin_chef_app/core/database/api/end_points.dart';
import 'package:admin_chef_app/core/database/errors/error_model.dart';
import 'package:admin_chef_app/core/database/errors/server_exception.dart';
import 'package:admin_chef_app/features/main_dashboard/data/models/all_system_meals_model/all_system_meals_model.dart';
import 'package:admin_chef_app/features/main_dashboard/data/models/chefs_data/all_chefs_data_model.dart';
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

  @override
  Future<Either<ErrorModel, AllChefsDataModel>> getAllSystemChefs()  async {

    try{
      final response=await api.get(EndPoints.getAllSystemChefsEndPoint);
      AllChefsDataModel allChefsDataModel=AllChefsDataModel.fromJson(response);
      return Right(allChefsDataModel);
    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> dealWithChefRequest({required String chefId, required String status}) async {
  
    
    try{
      final response=await api.post(EndPoints.dealWithChefRequestEndPoint(chefId: chefId, status: status));
      return Right(response[ApiKeys.message]);
    }
    on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> dealWithMealRequest({required String mealId, required String status}) async {

    try{
      final response=await api.post(EndPoints.dealWithMealRequestEndPoint(mealId: mealId, status: status));
      return Right(response[ApiKeys.message]);
    }
    on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> deleteMeal({required String mealId}) async
  {

    try
    {
      final response=await api.delete(EndPoints.deleteMealEndPoint(mealId: mealId));
      return Right(response[ApiKeys.message]);

    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }

  }

  @override
  Future<Either<ErrorModel, String>> deleteChef({required String chefId})  async {
    try
    {
      final response=await api.delete(EndPoints.deleteChefEndPoint(chefId: chefId));
      return Right(response[ApiKeys.message]);

    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel,String>> adminLogout() async {
   try
   {
     final response=await api.get(EndPoints.adminLogoutEndPoint);
     return Right(response[ApiKeys.message]);
   }on ServerException catch(e)
   {
     return Left(e.errorModel);
   }
  }




}