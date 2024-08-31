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
import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i373;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../features/auth/presentaion/screens/register/cubit/register_view_model.dart'
    as _i627;
import '../repository/auth_repository.dart' as _i106;
import '../use_cases/register_use_case.dart' as _i526;

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
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i373.AuthRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i106.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i526.RegisterUseCase>(() =>
        _i526.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i627.RegisterViewModel>(() =>
        _i627.RegisterViewModel(registerUseCase: gh<_i526.RegisterUseCase>()));
    return this;
  }
}
