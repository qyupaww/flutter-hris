import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/list_company_body.dart';
import '../../../domain/entities/list_company_entity.dart';
import '../../../domain/usecases/list_company_use_case.dart';

part 'list_company_event.dart';
part 'list_company_state.dart';

class ListCompanyBloc extends MorphemeBloc<ListCompanyEvent, ListCompanyState> {
  ListCompanyBloc({required this.useCase}) : super(ListCompanyInitial()) {
    on<FetchListCompany>((event, emit) async {
      emit(ListCompanyLoading(event.body, event.headers, event.extra));
      _cancelableOperation = CancelableOperation.fromFuture(
        useCase(
          event.body,
          headers: event.headers,
          cacheStrategy: event.cacheStrategy,
        ),
      );
      final result = await _cancelableOperation?.valueOrCancellation();

      if (result == null) {
        emit(ListCompanyCanceled(event.extra));
        return;
      }
      emit(
        result.fold(
          (failure) => ListCompanyFailed(
            event.body,
            event.headers,
            failure,
            event.extra,
          ),
          (success) => ListCompanySuccess(
            event.body,
            event.headers,
            success,
            event.extra,
          ),
        ),
      );
    });
    on<CancelListCompany>((event, emit) async {
      _cancelableOperation?.cancel();
      _cancelableOperation = null;
      emit(ListCompanyCanceled(event.extra));
    });
  }

  final ListCompanyUseCase useCase;

  CancelableOperation<Either<MorphemeFailure, ListCompanyEntity>>?
  _cancelableOperation;

  @override
  Future<void> close() {
    _cancelableOperation?.cancel();
    _cancelableOperation = null;
    return super.close();
  }
}
