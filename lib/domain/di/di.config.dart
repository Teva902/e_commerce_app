// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i45;
import '../../data/data_sources/remote_data_source/cart_remote_data_source.dart'
    as _i398;
import '../../data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i579;
import '../../data/data_sources/remote_data_source/impl/auth_remote_data_source_impl.dart'
    as _i1060;
import '../../data/data_sources/remote_data_source/impl/cart_remote_data_source_impl.dart'
    as _i872;
import '../../data/data_sources/remote_data_source/impl/home_remote_data_source_impl.dart'
    as _i354;
import '../../data/data_sources/remote_data_source/impl/watch_list_remote_data_source_impl.dart'
    as _i160;
import '../../data/data_sources/remote_data_source/watch_List_remote_data_source.dart'
    as _i695;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/cart_repository_impl.dart' as _i942;
import '../../data/repository/home_repository_impl.dart' as _i1043;
import '../../data/repository/watch_List_repository_impl.dart' as _i662;
import '../../features/auth/presentaion/screens/login/cubit/login_view_model.dart'
    as _i692;
import '../../features/auth/presentaion/screens/register/cubit/register_view_model.dart'
    as _i627;
import '../../features/cart/cubit/cart_screen_view_model.dart' as _i1055;
import '../../features/main_Layout/favourite_screen/cubit/watch_list_screen_view_model.dart'
    as _i468;
import '../../features/main_Layout/home/presentation/cubit/home_tab_view_model.dart'
    as _i98;
import '../../features/product_screen/cubit/products_screen_view_model.dart'
    as _i662;
import '../repository/auth_repository.dart' as _i106;
import '../repository/cart_repository.dart' as _i900;
import '../repository/home_repository.dart' as _i326;
import '../repository/watch_list_repository.dart' as _i180;
import '../use_cases/add_cart_use_case.dart' as _i424;
import '../use_cases/add_to_watch_list_use_case.dart' as _i575;
import '../use_cases/delete_cart_use_case.dart' as _i284;
import '../use_cases/delete_watch_list_use_case.dart' as _i503;
import '../use_cases/get_all_brands_use_case.dart' as _i59;
import '../use_cases/get_all_categories_use_case.dart' as _i924;
import '../use_cases/get_all_product_use_case.dart' as _i382;
import '../use_cases/get_cart_use_case.dart' as _i220;
import '../use_cases/get_watch_list_use_case.dart' as _i1002;
import '../use_cases/login_use_case.dart' as _i119;
import '../use_cases/register_use_case.dart' as _i526;
import '../use_cases/update_count_in_cart_use_case.dart' as _i786;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i236.ApiManager>(() => _i236.ApiManager());
    gh.factory<_i398.CartRemoteDataSource>(() =>
        _i872.CartRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i900.CartRepository>(() => _i942.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i398.CartRemoteDataSource>()));
    gh.factory<_i695.WatchListRemoteDataSource>(() =>
        _i160.WatchListRemoteDataSourceImpl(
            apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i220.GetCartUseCase>(
        () => _i220.GetCartUseCase(cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i284.DeleteItemInCartUseCase>(() =>
        _i284.DeleteItemInCartUseCase(
            cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i786.UpdateCountInCartUseCase>(() =>
        _i786.UpdateCountInCartUseCase(
            cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i1060.AuthRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i579.HomeRemoteDataSource>(() =>
        _i354.HomeRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i1055.CartScreenViewModel>(() => _i1055.CartScreenViewModel(
          getCartUseCase: gh<_i220.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i284.DeleteItemInCartUseCase>(),
          updateCountInCartUseCase: gh<_i786.UpdateCountInCartUseCase>(),
        ));
    gh.factory<_i106.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i326.HomeRepository>(() => _i1043.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i579.HomeRemoteDataSource>()));
    gh.factory<_i180.WatchListRepository>(() => _i662.WatchListRepositoryImpl(
        watchListRemoteDataSource: gh<_i695.WatchListRemoteDataSource>()));
    gh.factory<_i424.AddCartUseCase>(
        () => _i424.AddCartUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i575.AddToWatchListUseCase>(() => _i575.AddToWatchListUseCase(
        homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i59.GetAllBrandsUseCase>(() =>
        _i59.GetAllBrandsUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i924.GetAllCategoriesUseCase>(() =>
        _i924.GetAllCategoriesUseCase(
            homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i382.GetAllProductsUseCase>(() => _i382.GetAllProductsUseCase(
        homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i119.LoginUseCase>(
        () => _i119.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i526.RegisterUseCase>(() =>
        _i526.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i692.LoginViewModel>(
        () => _i692.LoginViewModel(loginUseCase: gh<_i119.LoginUseCase>()));
    gh.factory<_i1002.GetWatchListUseCase>(() => _i1002.GetWatchListUseCase(
        watchListRepository: gh<_i180.WatchListRepository>()));
    gh.factory<_i503.DeleteItemInWatchListUseCase>(() =>
        _i503.DeleteItemInWatchListUseCase(
            watchListRepository: gh<_i180.WatchListRepository>()));
    gh.factory<_i98.HomeTabViewModel>(() => _i98.HomeTabViewModel(
          categoriesUseCase: gh<_i924.GetAllCategoriesUseCase>(),
          brandsUseCase: gh<_i59.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i662.ProductScreenViewModel>(() => _i662.ProductScreenViewModel(
          getAllProductsUseCase: gh<_i382.GetAllProductsUseCase>(),
          addCartUseCase: gh<_i424.AddCartUseCase>(),
          addToWatchListUseCase: gh<_i575.AddToWatchListUseCase>(),
        ));
    gh.factory<_i627.RegisterViewModel>(() =>
        _i627.RegisterViewModel(registerUseCase: gh<_i526.RegisterUseCase>()));
    gh.factory<_i468.WatchListScreenViewModel>(
        () => _i468.WatchListScreenViewModel(
              getWatchListUseCase: gh<_i1002.GetWatchListUseCase>(),
              deleteItemInWatchListUseCase:
                  gh<_i503.DeleteItemInWatchListUseCase>(),
            ));
    return this;
  }
}
