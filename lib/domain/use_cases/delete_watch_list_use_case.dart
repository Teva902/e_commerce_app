import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/GetWatchListResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:e_commerce_app/domain/repository/watch_list_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemInWatchListUseCase {
  WatchListRepository watchListRepository;

  DeleteItemInWatchListUseCase({required this.watchListRepository});

  Future<Either<Failures, GetWatchListResponseEntity>> invoke(String productId) {
    return watchListRepository.deleteItemInWatchList(productId);
  }
}
