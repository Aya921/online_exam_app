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
import '../../features/auth/domin/repository/auth_repo.dart' as _i939;
import '../../features/auth/domin/usecases/forget_password_usecase.dart'
    as _i894;
import '../../features/auth/domin/usecases/reset_password_usecase.dart'
    as _i929;
import '../../features/auth/domin/usecases/signin.dart' as _i232;
import '../../features/auth/domin/usecases/signup_usecase.dart' as _i749;
import '../../features/auth/domin/usecases/verfity_reset_code_usecase.dart'
    as _i586;
import '../../features/auth/presentation/forget_password_cubit.dart' as _i297;
import '../../features/auth/presentation/view_model/forgot_password_view_model/forgot_password_view_model.dart'
    as _i624;
import '../../features/auth/presentation/view_model/reset_password_view_model/reset_password_view_model.dart'
    as _i552;
import '../../features/auth/presentation/view_model/signin_cubit/signin_cubit.dart'
    as _i116;
import '../../features/auth/presentation/view_model/signup_view_model/signup_view_model.dart'
    as _i401;
import '../../features/auth/presentation/view_model/verify_code_view_model/verify_code_view_model.dart'
    as _i518;
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
      () => databaseModule.flutterSecureStorage(),
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => registerModule.prettyDioLoggerProvider(),
    );
    gh.factory<_i406.ApiServises>(() => _i406.ApiServises(gh<_i361.Dio>()));
    gh.singleton<_i291.AppConfigProvider>(
      () => _i291.AppConfigProvider(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i115.TokenService>(
      () => _i115.TokenService(prefs: gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i984.AuthRemoteDataSource>(
      () => _i729.AuthRemoteDataSourceImp(
        gh<_i406.ApiServises>(),
        gh<_i115.TokenService>(),
      ),
    );
    gh.factory<_i939.AuthRepo>(
      () => _i751.AuthRepoImpl(gh<_i984.AuthRemoteDataSource>()),
    );
    gh.factory<_i232.SigninUsecase>(
      () => _i232.SigninUsecase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i894.ForgetPasswordUsecase>(
      () => _i894.ForgetPasswordUsecase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i749.SignupUseCase>(
      () => _i749.SignupUseCase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i586.VerfityResetCodeUsecase>(
      () => _i586.VerfityResetCodeUsecase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i929.ResetPasswordUsecase>(
      () => _i929.ResetPasswordUsecase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i624.ForgotPasswordViewModel>(
      () => _i624.ForgotPasswordViewModel(gh<_i894.ForgetPasswordUsecase>()),
    );
    gh.factory<_i297.ForgetPasswordBloc>(
      () => _i297.ForgetPasswordBloc(gh<_i894.ForgetPasswordUsecase>()),
    );
    gh.factory<_i116.SigninCubit>(
      () => _i116.SigninCubit(gh<_i232.SigninUsecase>()),
    );
    gh.factory<_i518.VerifyCodeViewModel>(
      () => _i518.VerifyCodeViewModel(
        gh<_i586.VerfityResetCodeUsecase>(),
        gh<_i894.ForgetPasswordUsecase>(),
      ),
    );
    gh.factory<_i401.SignupViewModel>(
      () => _i401.SignupViewModel(gh<_i749.SignupUseCase>()),
    );
    gh.factory<_i552.ResetPasswordViewModel>(
      () => _i552.ResetPasswordViewModel(gh<_i929.ResetPasswordUsecase>()),
    );
    return this;
  }
}

class _$DatabaseModule extends _i664.DatabaseModule {}

class _$RegisterModule extends _i983.RegisterModule {}
