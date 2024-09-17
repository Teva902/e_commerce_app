import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/features/auth/presentaion/screens/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  var emailController = TextEditingController(text: 'ahmed560@gmail.com');
  var passwordController = TextEditingController(text: 'Ahmed123456');

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((l) => {emit(LoginErrorState(failures: l))},
        (r) => {emit(LoginSuccessState(responseEntity: r))});
  }
}
