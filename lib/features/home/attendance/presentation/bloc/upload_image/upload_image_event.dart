part of 'upload_image_bloc.dart';

abstract class UploadImageEvent extends Equatable {
  const UploadImageEvent();

  @override
  List<Object> get props => [];
}

class DoUploadImage extends UploadImageEvent {
  const DoUploadImage(this.imageFile);

  final File imageFile;

  @override
  List<Object> get props => [imageFile];
}
