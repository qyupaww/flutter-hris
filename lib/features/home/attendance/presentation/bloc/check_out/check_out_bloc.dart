import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';

import '../../../domain/entities/check_out_entity.dart';
import '../../../domain/usecases/check_out_use_case.dart';
import '../../../data/models/body/check_out_body.dart';

part 'check_out_event.dart';
part 'check_out_state.dart';

class CheckOutBloc extends MorphemeBloc<CheckOutEvent, CheckOutState> {
  CheckOutBloc({required this.useCase}) : super(CheckOutInitial()) {
    on<DoCheckOut>((event, emit) async {
      emit(CheckOutLoading());
      _operation?.cancel();
      _operation = CancelableOperation.fromFuture(useCase(event.body));
      final result = await _operation?.valueOrCancellation();
      if (result == null) return;
      emit(
        result.fold(
          (failure) => CheckOutFailed(failure),
          (data) => CheckOutSuccess(data),
        ),
      );
    });
  }

  final CheckOutUseCase useCase;

  CancelableOperation<Either<MorphemeFailure, CheckOutEntity>>? _operation;

  @override
  Future<void> close() {
    _operation?.cancel();
    _operation = null;
    return super.close();
  }
}
