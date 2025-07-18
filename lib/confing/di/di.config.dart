// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/services/token_service.dart' as _i115;
import '../../features/auth/api/client/api_servises.dart' as _i406;
import '../../features/auth/api/source/auth_remote_data_imp.dart' as _i729;
import '../../features/auth/data/repository/auth_repo_impl.dart' as _i751;
import '../../features/auth/data/source/auth_api_service.dart' as _i984;
import '../../features/auth/domin/usecases/signin.dart' as _i232;
import '../../features/auth/presentation/view_model/signin_cubit/signin_cubit.dart'
    as _i116;
import '../provider/app_config_provider.dart' as _i291;
import 'modules/database_module.dart' as _i664;
import 'modules/dio_module.dart' as _i983;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => databaseModule.providesharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => databaseModule.secureStorage(),
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => registerModule.prettyDioLoggerProvider(),
    );
    gh.factory<_i406.ApiServises>(() => _i406.ApiServises(gh<_i361.Dio>()));
    gh.factory<_i115.TokenService>(
      () => _i115.TokenService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i291.AppConfigProvider>(
      () => _i291.AppConfigProvider(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i984.AuthRemoteDataSource>(
      () => _i729.AuthRemoteDataSourceImp(
        gh<_i406.ApiServises>(),
        gh<_i115.TokenService>(),
      ),
    );
    gh.factory<_i751.AuthRepoImpl>(
      () => _i751.AuthRepoImpl(gh<_i984.AuthRemoteDataSource>()),
    );
    gh.factory<_i232.SigninUsecase>(
      () => _i232.SigninUsecase(gh<_i751.AuthRepoImpl>()),
    );
    gh.factory<_i116.SigninCubit>(
      () => _i116.SigninCubit(gh<_i232.SigninUsecase>()),
    );
    return this;
  }
}

class _$DatabaseModule extends _i664.DatabaseModule {}

class _$RegisterModule extends _i983.RegisterModule {}
