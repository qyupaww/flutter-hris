import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';
import 'package:flutter/material.dart';

import 'package:morpheme_flutter_lite/features/history/history/data/models/body/history_body.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/entities/history_entity.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/usecases/history_use_case.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends MorphemeBloc<HistoryEvent, HistoryState> {
  HistoryBloc({required this.useCase}) : super(HistoryInitial()) {
    on<FetchHistory>((event, emit) async {
      emit(HistoryLoading(event.body, event.headers, event.extra));
      _cancelableOperation = CancelableOperation.fromFuture(
        useCase(
          event.body,
          headers: event.headers,
          cacheStrategy: event.cacheStrategy,
        ),
      );
      final result = await _cancelableOperation?.valueOrCancellation();

      if (result == null) {
        emit(HistoryCanceled(event.extra));
        return;
      }
      emit(
        result.fold(
          (failure) =>
              HistoryFailed(event.body, event.headers, failure, event.extra),
          (success) =>
              HistorySuccess(event.body, event.headers, success, event.extra),
        ),
      );
    });
    on<CancelHistory>((event, emit) async {
      _cancelableOperation?.cancel();
      _cancelableOperation = null;
      emit(HistoryCanceled(event.extra));
    });
  }

  final HistoryUseCase useCase;

  CancelableOperation<Either<MorphemeFailure, HistoryEntity>>?
  _cancelableOperation;

  @override
  Future<void> close() {
    _cancelableOperation?.cancel();
    _cancelableOperation = null;
    return super.close();
  }
}
