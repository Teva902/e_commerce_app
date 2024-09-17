import 'package:e_commerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/delete_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartScreenViewModel extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
DeleteItemInCartUseCase deleteItemInCartUseCase ;
UpdateCountInCartUseCase updateCountInCartUseCase ;
  CartScreenViewModel({required this.getCartUseCase,required this.deleteItemInCartUseCase,required this.updateCountInCartUseCase})
      : super(GetCartInitialState());
  List<GetProductCartEntity> productList = [];
static CartScreenViewModel get(context)=>BlocProvider.of(context);
  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) => emit(GetCartErrorState(failures: error)),
        (response) {
      productList = response.data!.products ?? [];
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }



  void deleteItemInCart(String productId) async {
    emit(DeleteCartLoadingState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((error) => emit(DeleteCartErrorState(failures: error)),
            (response) {
          // productList = response.data!.products ?? [];
          print('delete item in cart \n');
          print(response.numOfCartItems);
          emit(GetCartSuccessState(getCartResponseEntity: response));
        });
  }

  void updateItemCountInCart(String productId,int count) async {
    emit(UpdateCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId,count);
    either.fold((error) => emit(UpdateCartErrorState(failures: error)),
            (response) {
          // productList = response.data!.products ?? [];
          print('delete item in cart \n');
          print(response.numOfCartItems);
          emit(GetCartSuccessState(getCartResponseEntity: response));
        });
  }
}
