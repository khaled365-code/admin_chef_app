part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ActivateValidateMode extends LoginState {}

final class CheckBoxChangedState extends LoginState {}

final class LoginLoadingState extends LoginState {}


final class LoginFailureState extends LoginState {

  final ErrorModel errorModel;
  LoginFailureState(this.errorModel);
}
final class LoginSuccessState extends LoginState {

  final String successMessage;
  LoginSuccessState(this.successMessage);

}

final class ChangePasswordEyeShape extends LoginState {}
