import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'domain/usecases/register_use_case.dart';
import 'presentation/bloc/register/register_bloc.dart';
import 'data/datasources/register_remote_data_source.dart';
import 'data/repositories/register_repository_impl.dart';
import 'domain/repositories/register_repository.dart';
import 'domain/usecases/list_company_use_case.dart';
import 'presentation/bloc/list_company/list_company_bloc.dart';
import 'presentation/cubit/register_cubit.dart';

void setupLocatorRegister() {
  // *Cubit
  locator
    ..registerFactory(
      () => RegisterCubit(listCompanyBloc: locator(), registerBloc: locator()),
    )
    // *Bloc
    ..registerFactory(() => ListCompanyBloc(useCase: locator()))
    // *Usecase
    ..registerLazySingleton(() => ListCompanyUseCase(repository: locator()))
    // *Repository
    ..registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(remoteDataSource: locator()),
    )
    // *Datasource
    ..registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(http: locator()),
    )
    // *Bloc
    ..registerFactory(() => RegisterBloc(useCase: locator()))
    // *Usecase
    ..registerLazySingleton(() => RegisterUseCase(repository: locator()));
}
