import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:e_commerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  HomeRepository homeRepository;

  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeRepository.getAllCategories();
  }
}
