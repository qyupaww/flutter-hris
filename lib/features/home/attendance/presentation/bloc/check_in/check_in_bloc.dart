import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';

import '../../../domain/entities/check_in_entity.dart';
import '../../../domain/usecases/check_in_use_case.dart';
import '../../../data/models/body/check_in_body.dart';

part 'check_in_event.dart';
part 'check_in_state.dart';

class CheckInBloc extends MorphemeBloc<CheckInEvent, CheckInState> {
  CheckInBloc({required this.useCase}) : super(CheckInInitial()) {
    on<DoCheckIn>((event, emit) async {
      emit(CheckInLoading());
      _operation?.cancel();
      _operation = CancelableOperation.fromFuture(useCase(event.body));
      final result = await _operation?.valueOrCancellation();
      if (result == null) return;
      emit(
        result.fold(
          (failure) => CheckInFailed(failure),
          (data) => CheckInSuccess(data),
        ),
      );
    });
  }

  final CheckInUseCase useCase;

  CancelableOperation<Either<MorphemeFailure, CheckInEntity>>? _operation;

  @override
  Future<void> close() {
    _operation?.cancel();
    _operation = null;
    return super.close();
  }
}
