import 'package:e_commerce_app/domain/entity/GetWatchListResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/delete_watch_list_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_watch_list_use_case.dart';
import 'package:e_commerce_app/features/main_Layout/favourite_screen/cubit/watch_list_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class WatchListScreenViewModel extends Cubit<WatchListStates>{
  GetWatchListUseCase getWatchListUseCase ;
  DeleteItemInWatchListUseCase deleteItemInWatchListUseCase;
  WatchListScreenViewModel({required this.getWatchListUseCase,required this.deleteItemInWatchListUseCase}):super(GetWatchListInitialState());
  List<GetDataWatchListEntity>watchList=[];
  static WatchListScreenViewModel get(context)=>BlocProvider.of(context);
  void getWatchList() async {
    emit(GetWatchListLoadingState());
    var either = await getWatchListUseCase.invoke();
    either.fold((error) => emit(GetWatchListErrorState(failures: error)),
            (response) {
              watchList = response.data??[];
          emit(GetWatchListSuccessState(getWatchListResponseEntity: response));
        });
  }

  void deleteItemInWatchList(String productId) async {
    emit(DeleteWatchListLoadingState());
    var either = await deleteItemInWatchListUseCase.invoke(productId);
    either.fold((error) => emit(DeleteWatchListErrorState(failures: error)),
            (response) {
          watchList = response.data??[];
          print('delete item in watch list ');
          emit(GetWatchListSuccessState(getWatchListResponseEntity: response));
        });
  }
}