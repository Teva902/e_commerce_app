import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  // {
  // 'token':token.toString()
  // }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return dio.get(AppConstants.baseUrl + endPoint,
        options: Options(headers: headers, validateStatus: (status) => true),
        queryParameters: queryParameters);
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        options: Options(headers: headers, validateStatus: (status) => true),
        data: body,
        queryParameters: queryParameters);
  }

  Future<Response> deleteData(String endPoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.delete(AppConstants.baseUrl + endPoint,
        options: Options(headers: headers, validateStatus: (status) => true),
        data: body,
        queryParameters: queryParameters);
  }

  Future<Response> putData(String endPoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.put(AppConstants.baseUrl + endPoint,
        options: Options(headers: headers, validateStatus: (status) => true),
        data: body,
        queryParameters: queryParameters);
  }
}
