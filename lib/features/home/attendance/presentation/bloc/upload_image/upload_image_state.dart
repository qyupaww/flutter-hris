part of 'upload_image_bloc.dart';

abstract class UploadImageState extends Equatable {
  const UploadImageState();

  @override
  List<Object?> get props => [];

  void when({
    void Function(UploadImageInitial state)? onInitial,
    void Function(UploadImageLoading state)? onLoading,
    void Function(UploadImageFailed state)? onFailed,
    void Function(UploadImageSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is UploadImageInitial) {
      onInitial?.call(state);
    } else if (state is UploadImageLoading) {
      onLoading?.call(state);
    } else if (state is UploadImageFailed) {
      onFailed?.call(state);
    } else if (state is UploadImageSuccess) {
      onSuccess?.call(state);
    }
  }
}

class UploadImageInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}

class UploadImageFailed extends UploadImageState {
  const UploadImageFailed(this.failure);

  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}

class UploadImageSuccess extends UploadImageState {
  const UploadImageSuccess(this.imageUrl);

  final String imageUrl;

  @override
  List<Object?> get props => [imageUrl];
}
