import 'package:e_commerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';

abstract class CartStates{}
class GetCartInitialState extends CartStates{}
class GetCartLoadingState extends CartStates{}
class GetCartErrorState extends CartStates{
  Failures failures ;
  GetCartErrorState({required this.failures});
}
class GetCartSuccessState extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
  GetCartSuccessState({required this.getCartResponseEntity});
}
class DeleteCartLoadingState extends CartStates{}
class DeleteCartErrorState extends CartStates{
  Failures failures ;
  DeleteCartErrorState({required this.failures});
}
class DeleteCartSuccessState extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
  DeleteCartSuccessState({required this.getCartResponseEntity});
}
class UpdateCartLoadingState extends CartStates{}
class UpdateCartErrorState extends CartStates{
  Failures failures ;
  UpdateCartErrorState({required this.failures});
}
class UpdateCartSuccessState extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
  UpdateCartSuccessState({required this.getCartResponseEntity});
}