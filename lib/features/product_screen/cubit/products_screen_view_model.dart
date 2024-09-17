import 'package:e_commerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/add_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_watch_list_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_product_use_case.dart';
import 'package:e_commerce_app/features/product_screen/cubit/products_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductScreenViewModel extends Cubit<ProductScreenState>{
  GetAllProductsUseCase getAllProductsUseCase;
  AddCartUseCase addCartUseCase;
  AddToWatchListUseCase addToWatchListUseCase;
  ProductScreenViewModel({required this.getAllProductsUseCase,required this.addCartUseCase,required this.addToWatchListUseCase}):super(ProductScreenInitialState());
  List<ProductEntity> productList=[];
  int numOfCartItem = 0 ;
  static ProductScreenViewModel get(context)=>BlocProvider.of(context);
  void getAllProducts()async{
emit(ProductScreenLoadingState());
var either =await getAllProductsUseCase.invoke();
 either.fold((error){
emit(ProductScreenErrorState(failures: error));
}, (response){
   productList = response.data!;
emit(ProductScreenSuccessState(productResponseEntity: response));
});
  }


  void addToCart(String productId)async{
    emit(AddToCartLoadingState());
    var either =await addCartUseCase.invoke(productId);
    either.fold((error){
      emit(AddToCartErrorState(failures: error));
    }, (response){
      numOfCartItem = response.numOfCartItems!.toInt();
      print('num of cart items ${response.numOfCartItems}');
      emit(AddToCartSuccessState(cartResponseEntity: response));
    });
  }

  void addToWatchList(String productId)async{
    emit(AddToWatchListLoadingState());
    var either =await addToWatchListUseCase.invoke(productId);
    either.fold((error){
      emit(AddToWatchListErrorState(failures: error));
    }, (response){

      print('Add to watchList ${response.data}');
      emit(AddToWatchListSuccessState(addToWatchListEntity: response));
    });
  }
}