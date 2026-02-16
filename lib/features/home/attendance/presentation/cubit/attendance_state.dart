part of 'attendance_cubit.dart';

class AttendanceStateCubit extends Equatable {
  const AttendanceStateCubit({
    this.currentPosition,
    this.officePosition = const LatLng(-6.8908, 107.8015),
    this.maxRadius = 100,
    this.distanceInMeters = 0,
    this.gpsAccuracy = 0,
    this.isLoading = true,
    this.errorMessage,
  });

  final LatLng? currentPosition;
  final LatLng officePosition;
  final double maxRadius;
  final double distanceInMeters;
  final double gpsAccuracy;
  final bool isLoading;
  final String? errorMessage;

  bool get isInRadius => distanceInMeters <= maxRadius;

  AttendanceStateCubit copyWith({
    LatLng? currentPosition,
    LatLng? officePosition,
    double? maxRadius,
    double? distanceInMeters,
    double? gpsAccuracy,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AttendanceStateCubit(
      currentPosition: currentPosition ?? this.currentPosition,
      officePosition: officePosition ?? this.officePosition,
      maxRadius: maxRadius ?? this.maxRadius,
      distanceInMeters: distanceInMeters ?? this.distanceInMeters,
      gpsAccuracy: gpsAccuracy ?? this.gpsAccuracy,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    currentPosition,
    officePosition,
    maxRadius,
    distanceInMeters,
    gpsAccuracy,
    isLoading,
    errorMessage,
  ];
}
