

import 'package:admin_chef_app/core/database/errors/error_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo
{

  Future<Either<ErrorModel,String>>adminLogin({required String email,required String password});


}