import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:e_commerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCartUseCase {
  HomeRepository homeRepository;

  AddCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}
