import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/widget/shared_prefernce_utils.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerce_app/data/end_point.dart';
import 'package:e_commerce_app/data/model/AddCartResponseDto.dart';
import 'package:e_commerce_app/data/model/AddToWatchListDto.dart';
import 'package:e_commerce_app/data/model/CategoryResponseDto.dart';
import 'package:e_commerce_app/data/model/ProductResponseDto.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  ApiManager apiManager ;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllCategories() async{
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var response = await apiManager.getData(EndPoints.categories,);
        var categoryResponse = CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async{
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var response = await apiManager.getData(EndPoints.brands,);
        var brandsResponse = CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandsResponse);
        } else {
          return Left(ServerError(errorMessage: brandsResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts()async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var response = await apiManager.getData(EndPoints.product,);
        var productResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddCartResponseDto>> addToCart(String productId)async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
       var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.postData(EndPoints.addToCart,
          body:{
          "productId": productId
        },headers:   {
              'token':token.toString()
            }
        );
        var addToCartResponse = AddCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToCartResponse);
        }
        else if(response.statusCode==401){
          return Left(ServerError(errorMessage: addToCartResponse.message!));
        }
        else {
          return Left(ServerError(errorMessage: addToCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToWatchListDto>> addToWatchList(String productId)async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.postData(EndPoints.addToWatchList,
            body:{
              "productId": productId
            },headers:   {
              'token':token.toString()
            }
        );
        var addToWatchListResponse = AddToWatchListDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToWatchListResponse);
        }
        else if(response.statusCode==401){
          return Left(ServerError(errorMessage: addToWatchListResponse.message!));
        }
        else {
          return Left(ServerError(errorMessage: addToWatchListResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
  }
