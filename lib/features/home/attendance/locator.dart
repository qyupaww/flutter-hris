import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'data/datasources/attendance_remote_data_source.dart';
import 'data/datasources/company_detail_remote_data_source.dart';
import 'data/repositories/attendance_repository_impl.dart';
import 'data/repositories/company_detail_repository_impl.dart';
import 'domain/repositories/attendance_repository.dart';
import 'domain/repositories/company_detail_repository.dart';
import 'domain/usecases/attendance_today_use_case.dart';
import 'domain/usecases/check_in_use_case.dart';
import 'domain/usecases/check_out_use_case.dart';
import 'domain/usecases/company_detail_use_case.dart';
import 'presentation/bloc/attendance_today/attendance_today_bloc.dart';
import 'presentation/bloc/check_in/check_in_bloc.dart';
import 'presentation/bloc/check_out/check_out_bloc.dart';
import 'presentation/bloc/company_detail/company_detail_bloc.dart';
import 'presentation/cubit/attendance_cubit.dart';

void setupLocatorAttendance() {
  locator
    // Cubit
    ..registerFactory(
      () => AttendanceCubit(
        companyDetailBloc: locator(),
        checkInBloc: locator(),
        checkOutBloc: locator(),
        attendanceTodayBloc: locator(),
        attendanceRepository: locator(),
      ),
    )
    // Blocs
    ..registerFactory(() => CompanyDetailBloc(useCase: locator()))
    ..registerFactory(() => CheckInBloc(useCase: locator()))
    ..registerFactory(() => CheckOutBloc(useCase: locator()))
    ..registerFactory(() => AttendanceTodayBloc(useCase: locator()))
    // Use Cases
    ..registerLazySingleton(() => CompanyDetailUseCase(repository: locator()))
    ..registerLazySingleton(() => CheckInUseCase(repository: locator()))
    ..registerLazySingleton(() => CheckOutUseCase(repository: locator()))
    ..registerLazySingleton(() => AttendanceTodayUseCase(repository: locator()))
    // Repositories
    ..registerLazySingleton<CompanyDetailRepository>(
      () => CompanyDetailRepositoryImpl(remoteDataSource: locator()),
    )
    ..registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(remoteDataSource: locator()),
    )
    // Data Sources
    ..registerLazySingleton<CompanyDetailRemoteDataSource>(
      () => CompanyDetailRemoteDataSourceImpl(http: locator()),
    )
    ..registerLazySingleton<AttendanceRemoteDataSource>(
      () => AttendanceRemoteDataSourceImpl(http: locator()),
    );
}
