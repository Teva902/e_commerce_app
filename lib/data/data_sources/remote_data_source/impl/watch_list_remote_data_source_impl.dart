import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/widget/shared_prefernce_utils.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/watch_List_remote_data_source.dart';
import 'package:e_commerce_app/data/end_point.dart';
import 'package:e_commerce_app/data/model/GetWatchListResponseDto.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: WatchListRemoteDataSource)
class WatchListRemoteDataSourceImpl implements WatchListRemoteDataSource {
  ApiManager apiManager;

  WatchListRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetWatchListResponseDto>> getWatchList() async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.getData(EndPoints.addToWatchList,
            headers: {'token': token.toString()});
        var getWatchListResponse =
            GetWatchListResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getWatchListResponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(errorMessage: getWatchListResponse.message!));
        } else {
          return Left(ServerError(errorMessage: getWatchListResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetWatchListResponseDto>> deleteItemInWatchList(String productId) async{
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.deleteData('${EndPoints.addToWatchList}/$productId',
            headers: {'token': token.toString()});
        var deleteWatchListResponse =
        GetWatchListResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteWatchListResponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(errorMessage: deleteWatchListResponse.message!));
        } else {
          return Left(ServerError(errorMessage: deleteWatchListResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No Internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
