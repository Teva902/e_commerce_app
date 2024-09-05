import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/data/end_point.dart';
import 'package:e_commerce_app/data/model/LoginResponseDto.dart';
import 'package:e_commerce_app/data/model/RegisterResponseDto.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var response = await apiManager.postData(EndPoints.register, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDto>> login(String email,
      String password) async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var response = await apiManager.postData(EndPoints.logIn, body: {
          "email": email,
          "password": password,
        });
        var loginResponse = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
