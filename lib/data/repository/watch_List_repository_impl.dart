import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/watch_List_remote_data_source.dart';
import 'package:e_commerce_app/domain/entity/GetWatchListResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:e_commerce_app/domain/repository/watch_list_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:WatchListRepository )
class WatchListRepositoryImpl implements WatchListRepository {
  WatchListRemoteDataSource watchListRemoteDataSource;

  WatchListRepositoryImpl({required this.watchListRemoteDataSource});

  @override
  Future<Either<Failures, GetWatchListResponseEntity>> getWatchList() async{
    var either = await watchListRemoteDataSource.getWatchList();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetWatchListResponseEntity>> deleteItemInWatchList(String productId) async{
    var either = await watchListRemoteDataSource.deleteItemInWatchList(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }


}
