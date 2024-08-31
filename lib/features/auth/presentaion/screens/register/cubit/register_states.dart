import 'package:e_commerce_app/domain/entity/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  Failures failures;

  RegisterErrorState({required this.failures});
}

class RegisterSuccessState extends RegisterState {
  RegisterResponseEntity responseEntity;

  RegisterSuccessState({required this.responseEntity});
}
