import 'package:e_commerce_app/domain/entity/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entity/AddToWatchListEntity.dart';
import 'package:e_commerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';

abstract class ProductScreenState{}
class ProductScreenInitialState extends ProductScreenState{}
class ProductScreenLoadingState extends ProductScreenState{}
class ProductScreenErrorState extends ProductScreenState{
  Failures failures;
  ProductScreenErrorState({required this.failures});
}
class ProductScreenSuccessState extends ProductScreenState{
  ProductResponseEntity productResponseEntity;
  ProductScreenSuccessState({required this.productResponseEntity});
}
class AddToCartLoadingState extends ProductScreenState{}
class AddToCartErrorState extends ProductScreenState{
  Failures failures;
  AddToCartErrorState({required this.failures});
}
class AddToCartSuccessState extends ProductScreenState{
  AddCartResponseEntity cartResponseEntity;
  AddToCartSuccessState({required this.cartResponseEntity});
}
class AddToWatchListLoadingState extends ProductScreenState{}
class AddToWatchListErrorState extends ProductScreenState{
  Failures failures;
  AddToWatchListErrorState({required this.failures});
}
class AddToWatchListSuccessState extends ProductScreenState{
  AddToWatchListEntity addToWatchListEntity;
  AddToWatchListSuccessState({required this.addToWatchListEntity});
}