import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'data/datasources/logout_remote_data_source.dart';
import 'data/datasources/profile_remote_data_source.dart';
import 'data/repositories/logout_repository_impl.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/logout_repository.dart';
import 'domain/repositories/profile_repository.dart';
import 'domain/usecases/logout_use_case.dart';
import 'domain/usecases/get_profile_use_case.dart';
import 'presentation/bloc/logout/logout_bloc.dart';
import 'presentation/cubit/profile_cubit.dart';

void setupLocatorFeatureProfile() {
  locator
    ..registerFactory(
      () => ProfileCubit(logoutBloc: locator(), getProfileUseCase: locator()),
    )
    ..registerFactory(() => LogoutBloc(useCase: locator()))
    ..registerLazySingleton(() => LogoutUseCase(repository: locator()))
    ..registerLazySingleton<LogoutRepository>(
      () => LogoutRepositoryImpl(remoteDataSource: locator()),
    )
    ..registerLazySingleton<LogoutRemoteDataSource>(
      () => LogoutRemoteDataSourceImpl(http: locator()),
    )
    ..registerLazySingleton(() => GetProfileUseCase(repository: locator()))
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remoteDataSource: locator()),
    )
    ..registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(http: locator()),
    );
}
