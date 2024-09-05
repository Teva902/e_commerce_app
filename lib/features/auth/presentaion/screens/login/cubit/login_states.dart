import 'package:e_commerce_app/domain/entity/LoginResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  Failures failures;

  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginState {
  LoginResponseEntity responseEntity;

  LoginSuccessState({required this.responseEntity});
}
