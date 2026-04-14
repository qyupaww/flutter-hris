import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/company_detail_entity.dart';
import '../../../domain/usecases/company_detail_use_case.dart';

part 'company_detail_event.dart';
part 'company_detail_state.dart';

class CompanyDetailBloc
    extends MorphemeBloc<CompanyDetailEvent, CompanyDetailState> {
  CompanyDetailBloc({required this.useCase}) : super(CompanyDetailInitial()) {
    on<FetchCompanyDetail>((event, emit) async {
      emit(CompanyDetailLoading(event.companyId, event.headers, event.extra));
      _cancelableOperation = CancelableOperation.fromFuture(
        useCase(
          event.companyId,
          headers: event.headers,
          cacheStrategy: event.cacheStrategy,
        ),
      );
      final result = await _cancelableOperation?.valueOrCancellation();

      if (result == null) {
        emit(CompanyDetailCanceled(event.extra));
        return;
      }
      emit(
        result.fold(
          (failure) => CompanyDetailFailed(
            event.companyId,
            event.headers,
            failure,
            event.extra,
          ),
          (success) => CompanyDetailSuccess(
            event.companyId,
            event.headers,
            success,
            event.extra,
          ),
        ),
      );
    });
    on<CancelCompanyDetail>((event, emit) async {
      _cancelableOperation?.cancel();
      _cancelableOperation = null;
      emit(CompanyDetailCanceled(event.extra));
    });
  }

  final CompanyDetailUseCase useCase;

  CancelableOperation<Either<MorphemeFailure, CompanyDetailEntity>>?
  _cancelableOperation;

  @override
  Future<void> close() {
    _cancelableOperation?.cancel();
    _cancelableOperation = null;
    return super.close();
  }
}
