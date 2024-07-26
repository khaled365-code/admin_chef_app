import 'package:admin_chef_app/core/database/errors/error_model.dart';
import 'package:admin_chef_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepoImplementation}) : super(LoginInitial());


  final AuthRepoImplementation authRepoImplementation;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey();


  IconData suffixIcon = Icons.visibility_off;
  bool isObsecureText = true;

  changeEyeShape() {
    if (suffixIcon == Icons.visibility_off) {
      suffixIcon = Icons.visibility;
      isObsecureText = false;
    }
    else {
      suffixIcon = Icons.visibility_off;
      isObsecureText = true;
    }

    emit(ChangePasswordEyeShape());
  }

  bool termsCheckBoxValue=false;

  changeTermsCheckBoxValue()
  {
    termsCheckBoxValue=!termsCheckBoxValue;
    emit(CheckBoxchangedState());

  }

  loginFun({required String email,required String password}) async
  {
    emit(LoginLoadingState());

    final result = await authRepoImplementation.adminLogin(email: email, password:password);

    result.fold((errorModel) {
      emit(LoginFailureState(errorModel));
    }, (message) {
      emit(LoginSuccessState(message));
    });


  }


}