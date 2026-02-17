import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'data/datasources/company_detail_remote_data_source.dart';
import 'data/repositories/company_detail_repository_impl.dart';
import 'domain/repositories/company_detail_repository.dart';
import 'domain/usecases/company_detail_use_case.dart';
import 'presentation/bloc/company_detail/company_detail_bloc.dart';
import 'presentation/cubit/attendance_cubit.dart';

void setupLocatorAttendance() {
  locator
    ..registerFactory(() => AttendanceCubit(companyDetailBloc: locator()))
    ..registerFactory(() => CompanyDetailBloc(useCase: locator()))
    ..registerLazySingleton(() => CompanyDetailUseCase(repository: locator()))
    ..registerLazySingleton<CompanyDetailRepository>(
      () => CompanyDetailRepositoryImpl(remoteDataSource: locator()),
    )
    ..registerLazySingleton<CompanyDetailRemoteDataSource>(
      () => CompanyDetailRemoteDataSourceImpl(http: locator()),
    );
}
