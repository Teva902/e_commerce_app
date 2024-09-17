import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:e_commerce_app/domain/entity/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entity/AddToWatchListEntity.dart';
import 'package:e_commerce_app/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';
import 'package:e_commerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeRepository )
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands()async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts()async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId)async {
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddToWatchListEntity>> addToWatchList(String productId) async{
    var either = await homeRemoteDataSource.addToWatchList(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
