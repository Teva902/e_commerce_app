import 'package:e_commerce_app/domain/entity/GetWatchListResponseEntity.dart';
import 'package:e_commerce_app/domain/failuer.dart';

abstract class WatchListStates{}
class GetWatchListInitialState extends WatchListStates{}
class GetWatchListLoadingState extends WatchListStates{}
class GetWatchListErrorState extends WatchListStates{
  Failures failures ;
  GetWatchListErrorState({required this.failures});
}
class GetWatchListSuccessState extends WatchListStates{
  GetWatchListResponseEntity getWatchListResponseEntity;
  GetWatchListSuccessState({required this.getWatchListResponseEntity});
}
class DeleteWatchListLoadingState extends WatchListStates{}
class DeleteWatchListErrorState extends WatchListStates{
  Failures failures ;
  DeleteWatchListErrorState({required this.failures});
}
class DeleteWatchListSuccessState extends WatchListStates{
  GetWatchListResponseEntity getWatchListResponseEntity;
  DeleteWatchListSuccessState({required this.getWatchListResponseEntity});
}