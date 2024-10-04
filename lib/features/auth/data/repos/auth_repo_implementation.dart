


import 'package:admin_chef_app/core/database/api/api_consumer.dart';
import 'package:admin_chef_app/core/database/api/end_points.dart';
import 'package:admin_chef_app/core/database/cache/cache_helper.dart';
import 'package:admin_chef_app/core/database/errors/error_model.dart';
import 'package:admin_chef_app/core/database/errors/server_exception.dart';

import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/database/api/api_keys.dart';
import 'auth_repo.dart';

class AuthRepoImplementation implements AuthRepo
{

  final ApiConsumer api;

  AuthRepoImplementation({required this.api});


  @override
  Future<Either<ErrorModel, String>> adminLogin({required String email, required String password}) async
  {

    try
    {
      final response = await api.post(EndPoints.adminLoginEndPoint,
          data:
          {
            ApiKeys.email: email,
            ApiKeys.password: password
          });

      var userToken=response[ApiKeys.token];
      await Future.wait([
      CacheHelper().saveData(key: ApiKeys.token, value: userToken),
      CacheHelper().saveData(key: ApiKeys.id, value: JwtDecoder.decode(userToken)[ApiKeys.id]),
      CacheHelper().saveData(key: ApiKeys.email, value: JwtDecoder.decode(userToken)[ApiKeys.email]),
      CacheHelper().saveData(key: ApiKeys.name, value: JwtDecoder.decode(userToken)[ApiKeys.name]),
      ]);

      return Right(response[ApiKeys.message]);

    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }



  }








}