import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/auth/presentaion/screens/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var nameController = TextEditingController(text: 'Ahmed12');
  var emailController = TextEditingController(text: 'ahmed520@gmail.com');
  var passwordController = TextEditingController(text: 'Ahmed123456');
  var rePasswordController = TextEditingController(text: 'Ahmed123456');
  var phoneController = TextEditingController(text: '01212444300');

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    either.fold((l) => {emit(RegisterErrorState(failures: l))},
        (r) => {emit(RegisterSuccessState(responseEntity: r))});
  }
}
