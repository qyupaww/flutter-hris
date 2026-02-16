import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'data/datasources/logout_remote_data_source.dart';
import 'data/repositories/logout_repository_impl.dart';
import 'domain/repositories/logout_repository.dart';
import 'domain/usecases/logout_use_case.dart';
import 'presentation/bloc/logout/logout_bloc.dart';
import 'presentation/cubit/profile_cubit.dart';

void setupLocatorFeatureProfile() {
  locator
    ..registerFactory(() => ProfileCubit(logoutBloc: locator()))
    ..registerFactory(() => LogoutBloc(useCase: locator()))
    ..registerLazySingleton(() => LogoutUseCase(repository: locator()))
    ..registerLazySingleton<LogoutRepository>(
      () => LogoutRepositoryImpl(remoteDataSource: locator()),
    )
    ..registerLazySingleton<LogoutRemoteDataSource>(
      () => LogoutRemoteDataSourceImpl(http: locator()),
    );
}
