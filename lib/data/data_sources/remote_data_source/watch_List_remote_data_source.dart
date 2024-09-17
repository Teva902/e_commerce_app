import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/GetWatchListResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';

abstract class WatchListRemoteDataSource{
 Future<Either<Failures,GetWatchListResponseEntity>> getWatchList();
 Future<Either<Failures,GetWatchListResponseEntity>> deleteItemInWatchList(String productId);

}