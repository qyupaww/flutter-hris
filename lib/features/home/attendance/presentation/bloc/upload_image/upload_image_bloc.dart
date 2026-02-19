import 'dart:io';

import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_http/morpheme_http.dart';

import '../../../domain/usecases/upload_image_use_case.dart';

part 'upload_image_event.dart';
part 'upload_image_state.dart';

class UploadImageBloc extends MorphemeBloc<UploadImageEvent, UploadImageState> {
  UploadImageBloc({required this.useCase}) : super(UploadImageInitial()) {
    on<DoUploadImage>((event, emit) async {
      emit(UploadImageLoading());
      _operation?.cancel();
      _operation = CancelableOperation.fromFuture(useCase(event.imageFile));
      final result = await _operation?.valueOrCancellation();
      if (result == null) return;
      emit(
        result.fold(
          (failure) => UploadImageFailed(failure),
          (imageUrl) => UploadImageSuccess(imageUrl),
        ),
      );
    });
  }

  final UploadImageUseCase useCase;

  CancelableOperation<Either<MorphemeFailure, String>>? _operation;

  @override
  Future<void> close() {
    _operation?.cancel();
    _operation = null;
    return super.close();
  }
}
