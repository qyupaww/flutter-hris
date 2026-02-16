import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/login_body.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends MorphemeBloc<LoginEvent, LoginState> {
  LoginBloc({required this.useCase}) : super(LoginInitial()) {
    on<FetchLogin>((event, emit) async {
      emit(LoginLoading(event.body, event.headers, event.extra));
      _cancelableOperation = CancelableOperation.fromFuture(
        useCase(
          event.body,
          headers: event.headers,
          cacheStrategy: event.cacheStrategy,
        ),
      );
      final result = await _cancelableOperation?.valueOrCancellation();

      if (result == null) {
        emit(LoginCanceled(event.extra));
        return;
      }
      emit(
        result.fold(
          (failure) =>
              LoginFailed(event.body, event.headers, failure, event.extra),
          (success) =>
              LoginSuccess(event.body, event.headers, success, event.extra),
        ),
      );
    });
    on<CancelLogin>((event, emit) async {
      _cancelableOperation?.cancel();
      _cancelableOperation = null;
      emit(LoginCanceled(event.extra));
    });
  }

  final LoginUseCase useCase;

  CancelableOperation<Either<MorphemeFailure, LoginEntity>>?
  _cancelableOperation;

  @override
  Future<void> close() {
    _cancelableOperation?.cancel();
    _cancelableOperation = null;
    return super.close();
  }
}
