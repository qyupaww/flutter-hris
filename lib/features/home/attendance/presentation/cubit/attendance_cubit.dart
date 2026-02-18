import 'dart:io';
import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/extensions/morpheme_failure_extension.dart';
import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/data/models/body/check_in_body.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/data/models/body/check_out_body.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/domain/repositories/attendance_repository.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/bloc/attendance_today/attendance_today_bloc.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/bloc/check_in/check_in_bloc.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/bloc/check_out/check_out_bloc.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/bloc/company_detail/company_detail_bloc.dart';
part 'attendance_state.dart';

class AttendanceCubit extends MorphemeCubit<AttendanceStateCubit> {
  AttendanceCubit({
    required this.companyDetailBloc,
    required this.checkInBloc,
    required this.checkOutBloc,
    required this.attendanceTodayBloc,
    required this.attendanceRepository,
  }) : super(const AttendanceStateCubit());

  final CompanyDetailBloc companyDetailBloc;
  final CheckInBloc checkInBloc;
  final CheckOutBloc checkOutBloc;
  final AttendanceTodayBloc attendanceTodayBloc;
  final AttendanceRepository attendanceRepository;
  final MapController mapController = MapController();
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState(BuildContext context) {
    super.initState(context);
    _fetchCompanyDetail();
    _fetchTodayStatus();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
    BlocProvider<CompanyDetailBloc>.value(value: companyDetailBloc),
    BlocProvider<CheckInBloc>.value(value: checkInBloc),
    BlocProvider<CheckOutBloc>.value(value: checkOutBloc),
    BlocProvider<AttendanceTodayBloc>.value(value: attendanceTodayBloc),
  ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
    BlocListener<CompanyDetailBloc, CompanyDetailState>(
      listener: _listenerCompanyDetailBloc,
    ),
    BlocListener<CheckInBloc, CheckInState>(listener: _listenerCheckInBloc),
    BlocListener<CheckOutBloc, CheckOutState>(listener: _listenerCheckOutBloc),
    BlocListener<AttendanceTodayBloc, AttendanceTodayState>(
      listener: _listenerAttendanceTodayBloc,
    ),
  ];

  @override
  void dispose() {
    companyDetailBloc.close();
    checkInBloc.close();
    checkOutBloc.close();
    attendanceTodayBloc.close();
    mapController.dispose();
    super.dispose();
  }

  // ─── API Calls ──────────────────────────────────────────

  Future<void> _fetchCompanyDetail() async {
    final user = await FlutterSecureStorageHelper.getUser();
    final companyId = user?.companyId;

    if (companyId == null) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Company ID not found. Please re-login.',
        ),
      );
      return;
    }

    companyDetailBloc.add(FetchCompanyDetail(companyId));
  }

  void _fetchTodayStatus() {
    attendanceTodayBloc.add(FetchAttendanceToday());
  }

  // ─── Camera ─────────────────────────────────────────────

  Future<void> takeSelfie() async {
    final XFile? photo = await _imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );

    if (photo != null) {
      emit(state.copyWith(selfieFile: File(photo.path)));
    }
  }

  // ─── Check In / Check Out ───────────────────────────────

  Future<void> doCheckIn() async {
    if (state.currentPosition == null || state.selfieFile == null) return;

    emit(state.copyWith(isSubmitting: true));

    final uploadResult = await attendanceRepository.uploadImage(
      state.selfieFile!,
    );

    uploadResult.fold(
      (failure) {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: 'Failed to upload photo.',
          ),
        );
      },
      (imageUrl) {
        emit(state.copyWith(selfieUrl: imageUrl));
        checkInBloc.add(
          DoCheckIn(
            CheckInBody(
              latitude: state.currentPosition!.latitude,
              longitude: state.currentPosition!.longitude,
              photo: imageUrl,
            ),
          ),
        );
      },
    );
  }

  Future<void> doCheckOut() async {
    if (state.currentPosition == null || state.selfieFile == null) return;

    emit(state.copyWith(isSubmitting: true));

    final uploadResult = await attendanceRepository.uploadImage(
      state.selfieFile!,
    );

    uploadResult.fold(
      (failure) {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: 'Failed to upload photo.',
          ),
        );
      },
      (imageUrl) {
        emit(state.copyWith(selfieUrl: imageUrl));
        checkOutBloc.add(
          DoCheckOut(
            CheckOutBody(
              latitude: state.currentPosition!.latitude,
              longitude: state.currentPosition!.longitude,
              photo: imageUrl,
            ),
          ),
        );
      },
    );
  }

  // ─── Listeners ──────────────────────────────────────────

  void _listenerCompanyDetailBloc(
    BuildContext context,
    CompanyDetailState companyState,
  ) {
    companyState.when(
      onFailed: (state) {
        state.failure.showSnackbar(context);
        emit(
          this.state.copyWith(
            isLoading: false,
            errorMessage: 'Failed to load company data.',
          ),
        );
      },
      onSuccess: (state) {
        final data = state.data.data;
        if (data != null &&
            data.latitude != null &&
            data.longitude != null &&
            data.maxRadius != null) {
          final officePos = LatLng(data.latitude!, data.longitude!);
          emit(
            this.state.copyWith(
              officePosition: officePos,
              maxRadius: data.maxRadius!.toDouble(),
            ),
          );
          fetchCurrentLocation();
        } else {
          emit(
            this.state.copyWith(
              isLoading: false,
              errorMessage: 'Company location data is incomplete.',
            ),
          );
        }
      },
    );
  }

  void _listenerCheckInBloc(BuildContext context, CheckInState checkInState) {
    checkInState.when(
      onFailed: (state) {
        state.failure.showSnackbar(context);
        emit(this.state.copyWith(isSubmitting: false));
      },
      onSuccess: (state) {
        emit(
          this.state.copyWith(
            isSubmitting: false,
            isCheckedIn: true,
            checkInTime: _toLocalTime(state.data.data?.checkInTime),
            clearSelfie: true,
          ),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Check In berhasil!')));
        }
      },
    );
  }

  void _listenerCheckOutBloc(
    BuildContext context,
    CheckOutState checkOutState,
  ) {
    checkOutState.when(
      onFailed: (state) {
        state.failure.showSnackbar(context);
        emit(this.state.copyWith(isSubmitting: false));
      },
      onSuccess: (state) {
        emit(
          this.state.copyWith(
            isSubmitting: false,
            isCheckedOut: true,
            checkOutTime: _toLocalTime(state.data.data?.checkOutTime),
            clearSelfie: true,
          ),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Check Out berhasil!')));
        }
      },
    );
  }

  void _listenerAttendanceTodayBloc(
    BuildContext context,
    AttendanceTodayState todayState,
  ) {
    todayState.when(
      onFailed: (state) {},
      onSuccess: (state) {
        final data = state.data.data;
        if (data != null) {
          final localCheckIn = _toLocalTime(data.checkInTime);
          final localCheckOut = _toLocalTime(data.checkOutTime);
          emit(
            this.state.copyWith(
              isCheckedIn: data.isCheckedIn ?? (localCheckIn != null),
              isCheckedOut: data.isCheckedOut ?? (localCheckOut != null),
              checkInTime: localCheckIn,
              checkOutTime: localCheckOut,
              checkInStatus: data.checkInStatus,
              checkOutStatus: data.checkOutStatus,
            ),
          );
        }
      },
    );
  }

  static String? _toLocalTime(String? utcTime) {
    if (utcTime == null || utcTime.isEmpty) return null;
    try {
      final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final utcDateTime = DateTime.parse('${today}T${utcTime}Z');
      final local = utcDateTime.toLocal();
      return DateFormat('HH:mm:ss').format(local);
    } catch (_) {
      return utcTime;
    }
  }

  // ─── Location ───────────────────────────────────────────

  Future<void> fetchCurrentLocation() async {
    emit(state.copyWith(isLoading: true));

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Location services are disabled.',
          ),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: 'Location permissions are denied.',
            ),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Location permissions are permanently denied.',
          ),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      final userLatLng = LatLng(position.latitude, position.longitude);

      final officePos = state.officePosition;
      if (officePos == null) {
        emit(
          state.copyWith(
            currentPosition: userLatLng,
            gpsAccuracy: position.accuracy,
            isLoading: false,
          ),
        );
        return;
      }

      final distance = Geolocator.distanceBetween(
        userLatLng.latitude,
        userLatLng.longitude,
        officePos.latitude,
        officePos.longitude,
      );

      emit(
        state.copyWith(
          currentPosition: userLatLng,
          distanceInMeters: distance,
          gpsAccuracy: position.accuracy,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          currentPosition: state.officePosition,
          distanceInMeters: 0,
          gpsAccuracy: 999,
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void recenterMap() {
    if (state.currentPosition != null) {
      mapController.move(state.currentPosition!, 17);
    }
  }
}
