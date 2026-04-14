import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'data/datasources/history_remote_data_source.dart';
import 'data/repositories/history_repository_impl.dart';
import 'domain/repositories/history_repository.dart';
import 'domain/usecases/history_use_case.dart';
import 'presentation/bloc/history/history_bloc.dart';

void setupLocatorHistory() {
  locator
    // *Bloc
    ..registerFactory(() => HistoryBloc(useCase: locator()))
    // *Usecase
    ..registerLazySingleton(() => HistoryUseCase(repository: locator()))
    // *Repository
    ..registerLazySingleton<HistoryRepository>(
      () => HistoryRepositoryImpl(remoteDataSource: locator()),
    )
    // *Datasource
    ..registerLazySingleton<HistoryRemoteDataSource>(
      () => HistoryRemoteDataSourceImpl(http: locator()),
    );
}
