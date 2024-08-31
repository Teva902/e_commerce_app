import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters}) {
    return dio.get(AppConstants.baseUrl + endPoint,
        options: Options(validateStatus: (status) => true),
        queryParameters: queryParameters);
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        options: Options(validateStatus: (status) => true),
        data: body,
        queryParameters: queryParameters);
  }
}
