import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entity/AddToWatchListEntity.dart';
import 'package:e_commerce_app/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';

abstract class HomeRemoteDataSource{
 Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategories();
 Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrands();
 Future<Either<Failures,ProductResponseEntity>> getAllProducts();
 Future<Either<Failures,AddCartResponseEntity>> addToCart(String productId);
 Future<Either<Failures,AddToWatchListEntity>> addToWatchList(String productId);
}