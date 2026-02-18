part of 'attendance_cubit.dart';

class AttendanceStateCubit extends Equatable {
  const AttendanceStateCubit({
    this.currentPosition,
    this.officePosition,
    this.maxRadius = 0,
    this.distanceInMeters = 0,
    this.gpsAccuracy = 0,
    this.isLoading = true,
    this.errorMessage,
    this.selfieFile,
    this.selfieUrl,
    this.isCheckedIn = false,
    this.isCheckedOut = false,
    this.checkInTime,
    this.checkOutTime,
    this.checkInStatus,
    this.checkOutStatus,
    this.isSubmitting = false,
  });

  final LatLng? currentPosition;
  final LatLng? officePosition;
  final double maxRadius;
  final double distanceInMeters;
  final double gpsAccuracy;
  final bool isLoading;
  final String? errorMessage;

  // Selfie
  final File? selfieFile;
  final String? selfieUrl;

  // Today status
  final bool isCheckedIn;
  final bool isCheckedOut;
  final String? checkInTime;
  final String? checkOutTime;
  final String? checkInStatus;
  final String? checkOutStatus;

  // Submission loading
  final bool isSubmitting;

  bool get isInRadius =>
      officePosition != null && distanceInMeters <= maxRadius;

  bool get canCheckIn => isInRadius && !isCheckedIn && selfieFile != null;
  bool get canCheckOut =>
      isInRadius && isCheckedIn && !isCheckedOut && selfieFile != null;

  AttendanceStateCubit copyWith({
    LatLng? currentPosition,
    LatLng? officePosition,
    double? maxRadius,
    double? distanceInMeters,
    double? gpsAccuracy,
    bool? isLoading,
    String? errorMessage,
    File? selfieFile,
    String? selfieUrl,
    bool? isCheckedIn,
    bool? isCheckedOut,
    String? checkInTime,
    String? checkOutTime,
    String? checkInStatus,
    String? checkOutStatus,
    bool? isSubmitting,
    bool clearSelfie = false,
  }) {
    return AttendanceStateCubit(
      currentPosition: currentPosition ?? this.currentPosition,
      officePosition: officePosition ?? this.officePosition,
      maxRadius: maxRadius ?? this.maxRadius,
      distanceInMeters: distanceInMeters ?? this.distanceInMeters,
      gpsAccuracy: gpsAccuracy ?? this.gpsAccuracy,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      selfieFile: clearSelfie ? null : (selfieFile ?? this.selfieFile),
      selfieUrl: clearSelfie ? null : (selfieUrl ?? this.selfieUrl),
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      isCheckedOut: isCheckedOut ?? this.isCheckedOut,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      checkInStatus: checkInStatus ?? this.checkInStatus,
      checkOutStatus: checkOutStatus ?? this.checkOutStatus,
      isSubmitting: isSubmitting ?? this.isSubmitting,
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
    selfieFile,
    selfieUrl,
    isCheckedIn,
    isCheckedOut,
    checkInTime,
    checkOutTime,
    checkInStatus,
    checkOutStatus,
    isSubmitting,
  ];
}
