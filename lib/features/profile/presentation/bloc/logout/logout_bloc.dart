import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';

import 'package:morpheme_flutter_lite/features/profile/domain/entities/logout_entity.dart';
import 'package:morpheme_flutter_lite/features/profile/domain/usecases/logout_use_case.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends MorphemeBloc<LogoutEvent, LogoutState> {
  LogoutBloc({required this.useCase}) : super(LogoutInitial()) {
    on<FetchLogout>((event, emit) async {
      emit(LogoutLoading(event.headers, event.extra));
      final result = await useCase(null, headers: event.headers);
      emit(
        result.fold(
          (failure) => LogoutFailed(event.headers, failure, event.extra),
          (success) => LogoutSuccess(event.headers, success, event.extra),
        ),
      );
    });
  }

  final LogoutUseCase useCase;
}
