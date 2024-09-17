import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/widget/shared_prefernce_utils.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app/data/model/GetCartResponseDto.dart';
import 'package:e_commerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../end_point.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  ApiManager apiManager ;
  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart()async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.getData(EndPoints.addToCart,
           headers:   {
              'token':token.toString()
            }
        );
        var getCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        }
        else if(response.statusCode==401){
          return Left(ServerError(errorMessage: getCartResponse.message!));
        }
        else {
          return Left(ServerError(errorMessage: getCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(String productId)async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.deleteData('${EndPoints.addToCart}/$productId',
            headers:   {
              'token':token.toString()
            }
        );
        var deleteCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteCartResponse);
        }
        else if(response.statusCode==401){
          return Left(ServerError(errorMessage: deleteCartResponse.message!));
        }
        else {
          return Left(ServerError(errorMessage: deleteCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(String productId, int count)async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.putData('${EndPoints.addToCart}/$productId',
            body: {
          'count':'$count'
            },
            headers:   {
              'token':token.toString()
            }
        );
        var updateCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCartResponse);
        }
        else if(response.statusCode==401){
          return Left(ServerError(errorMessage: updateCartResponse.message!));
        }
        else {
          return Left(ServerError(errorMessage: updateCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}


