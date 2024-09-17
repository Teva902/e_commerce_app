import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/AddToWatchListEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:e_commerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWatchListUseCase {
  HomeRepository homeRepository;

  AddToWatchListUseCase({required this.homeRepository});

  Future<Either<Failures, AddToWatchListEntity>> invoke(String productId) {
    return homeRepository.addToWatchList(productId);
  }
}
