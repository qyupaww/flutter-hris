import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';

import '../../../domain/entities/attendance_today_entity.dart';
import '../../../domain/usecases/attendance_today_use_case.dart';

part 'attendance_today_event.dart';
part 'attendance_today_state.dart';

class AttendanceTodayBloc
    extends MorphemeBloc<AttendanceTodayEvent, AttendanceTodayState> {
  AttendanceTodayBloc({required this.useCase})
    : super(AttendanceTodayInitial()) {
    on<FetchAttendanceToday>((event, emit) async {
      emit(AttendanceTodayLoading());
      _operation?.cancel();
      _operation = CancelableOperation.fromFuture(useCase(null));
      final result = await _operation?.valueOrCancellation();
      if (result == null) return;
      emit(
        result.fold(
          (failure) => AttendanceTodayFailed(failure),
          (data) => AttendanceTodaySuccess(data),
        ),
      );
    });
  }

  final AttendanceTodayUseCase useCase;

  CancelableOperation<Either<MorphemeFailure, AttendanceTodayEntity>>?
  _operation;

  @override
  Future<void> close() {
    _operation?.cancel();
    _operation = null;
    return super.close();
  }
}
