import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:e_commerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  HomeRepository homeRepository;

  GetAllProductsUseCase({required this.homeRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeRepository.getAllProducts();
  }
}
