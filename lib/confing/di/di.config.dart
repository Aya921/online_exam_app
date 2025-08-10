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
import '../../features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart'
    as _i1043;
import '../../features/auth/presentation/view_model/signin_cubit/signin_cubit.dart'
    as _i116;
import '../../features/auth/presentation/view_model/signup_view_model/signup_view_model.dart'
    as _i401;
import '../../features/exam/api/client/api_service.dart' as _i376;
import '../../features/exam/api/source/exam_data_remote_imp.dart' as _i387;
import '../../features/exam/data/repository/exam_repository_imp.dart' as _i226;
import '../../features/exam/data/source/exam_data_source.dart' as _i660;
import '../../features/exam/domin/repository/exam_repository.dart' as _i1067;
import '../../features/exam/domin/usecase/get_all_subjects_usecase.dart'
    as _i1034;
import '../../features/exam/domin/usecase/get_all_user_data_usecase.dart'
    as _i901;
import '../../features/exam/domin/usecase/get_exams_on_subject_usecase.dart'
    as _i330;
import '../../features/exam/domin/usecase/get_questions_usecase.dart' as _i79;
import '../../features/exam/presentation/view_models/exams_view_model/cubit/exams_cubit.dart'
    as _i249;
import '../../features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart'
    as _i620;
import '../../features/exam/presentation/view_models/subject_view_model/cubit/explore_cubit.dart'
    as _i621;
import '../../features/profile/api/client/api_servises.dart' as _i36;
import '../../features/profile/api/sources/profile_remote_data_imp.dart'
    as _i34;
import '../../features/profile/data/repository/profile_repo_impl.dart' as _i265;
import '../../features/profile/data/sources/profile_api_servises.dart' as _i525;
import '../../features/profile/domin/repository/profile_repo.dart' as _i1009;
import '../../features/profile/domin/usecases/change_password_usecase.dart'
    as _i246;
import '../../features/profile/domin/usecases/update_user_data_usecase.dart'
    as _i753;
import '../../features/profile/presentation/view_model/cubit/change_password_cubit.dart'
    as _i348;
import '../../features/profile/presentation/view_model/cubit/update_profile_cubit.dart'
    as _i1029;
import '../provider/app_config_provider.dart' as _i291;
import 'modules/database_module.dart' as _i664;
import 'modules/dio_module.dart' as _i983;
import 'modules/token_interceptor.dart' as _i89;

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
    gh.factory<_i89.TokenInterceptor>(() => _i89.TokenInterceptor());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => databaseModule.flutterSecureStorage(),
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => registerModule.prettyDioLoggerProvider(),
    );
    gh.factory<_i406.ApiServises>(() => _i406.ApiServises(gh<_i361.Dio>()));
    gh.factory<_i376.ExamApiService>(
      () => _i376.ExamApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i36.ProfileApiServises>(
      () => _i36.ProfileApiServises(gh<_i361.Dio>()),
    );
    gh.factory<_i115.TokenService>(
      () => _i115.TokenService(
        prefs: gh<_i558.FlutterSecureStorage>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.singleton<_i291.AppConfigProvider>(
      () => _i291.AppConfigProvider(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i660.ExamRemoteDataSource>(
      () => _i387.ExamRemoteDataSourceImp(gh<_i376.ExamApiService>()),
    );
    gh.factory<_i525.ProfileRemoteDataSource>(
      () => _i34.ProfileRemoteDataImp(
        gh<_i36.ProfileApiServises>(),
        gh<_i115.TokenService>(),
      ),
    );
    gh.factory<_i984.AuthRemoteDataSource>(
      () => _i729.AuthRemoteDataSourceImp(
        gh<_i406.ApiServises>(),
        gh<_i115.TokenService>(),
      ),
    );
    gh.factory<_i1067.ExamRepository>(
      () => _i226.ExamRepositoryImp(gh<_i660.ExamRemoteDataSource>()),
    );
    gh.factory<_i939.AuthRepo>(
      () => _i751.AuthRepoImpl(gh<_i984.AuthRemoteDataSource>()),
    );
    gh.factory<_i1034.GetAllSubjectsUsecase>(
      () => _i1034.GetAllSubjectsUsecase(gh<_i1067.ExamRepository>()),
    );
    gh.factory<_i330.GetExamsOnSubjectUsecase>(
      () => _i330.GetExamsOnSubjectUsecase(gh<_i1067.ExamRepository>()),
    );
    gh.factory<_i79.GetQuestionsUsecase>(
      () => _i79.GetQuestionsUsecase(gh<_i1067.ExamRepository>()),
    );
    gh.factory<_i901.GetAllUserDataUsecase>(
      () => _i901.GetAllUserDataUsecase(gh<_i1067.ExamRepository>()),
    );
    gh.factory<_i1009.ProfileRepo>(
      () => _i265.ProfileRepoImpl(gh<_i525.ProfileRemoteDataSource>()),
    );
    gh.factory<_i232.SigninUsecase>(
      () => _i232.SigninUsecase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i249.ExamsCubit>(
      () => _i249.ExamsCubit(gh<_i330.GetExamsOnSubjectUsecase>()),
    );
    gh.factory<_i894.ForgetPasswordUsecase>(
      () => _i894.ForgetPasswordUsecase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i929.ResetPasswordUsecase>(
      () => _i929.ResetPasswordUsecase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i749.SignupUseCase>(
      () => _i749.SignupUseCase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i586.VerfityResetCodeUsecase>(
      () => _i586.VerfityResetCodeUsecase(gh<_i939.AuthRepo>()),
    );
    gh.factory<_i620.QustionViewModel>(
      () => _i620.QustionViewModel(gh<_i79.GetQuestionsUsecase>()),
    );
    gh.factory<_i116.SigninCubit>(
      () => _i116.SigninCubit(gh<_i232.SigninUsecase>()),
    );
    gh.factory<_i621.ExploreCubit>(
      () => _i621.ExploreCubit(
        getAllSubjectsUsecase: gh<_i1034.GetAllSubjectsUsecase>(),
      ),
    );
    gh.factory<_i246.ChangePasswordUsecase>(
      () => _i246.ChangePasswordUsecase(gh<_i1009.ProfileRepo>()),
    );
    gh.factory<_i753.UpdateUserDataUsecase>(
      () => _i753.UpdateUserDataUsecase(gh<_i1009.ProfileRepo>()),
    );
    gh.factory<_i348.ChangePasswordCubit>(
      () => _i348.ChangePasswordCubit(
        changePasswordUsecase: gh<_i246.ChangePasswordUsecase>(),
      ),
    );
    gh.factory<_i401.SignupViewModel>(
      () => _i401.SignupViewModel(gh<_i749.SignupUseCase>()),
    );
    gh.factory<_i1029.UpdateProfileCubit>(
      () => _i1029.UpdateProfileCubit(gh<_i753.UpdateUserDataUsecase>()),
    );
    gh.factory<_i1043.ForgetPasswordBloc>(
      () => _i1043.ForgetPasswordBloc(
        gh<_i894.ForgetPasswordUsecase>(),
        gh<_i929.ResetPasswordUsecase>(),
        gh<_i586.VerfityResetCodeUsecase>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i664.DatabaseModule {}

class _$RegisterModule extends _i983.RegisterModule {}
