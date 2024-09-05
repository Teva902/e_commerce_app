import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/LoginResponseEntity.dart';
import 'package:e_commerce_app/domain/entity/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
