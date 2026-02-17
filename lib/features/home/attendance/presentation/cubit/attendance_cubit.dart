import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/extensions/morpheme_failure_extension.dart';
import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/bloc/company_detail/company_detail_bloc.dart';

part 'attendance_state.dart';

class AttendanceCubit extends MorphemeCubit<AttendanceStateCubit> {
  AttendanceCubit({required this.companyDetailBloc})
    : super(const AttendanceStateCubit());

  final CompanyDetailBloc companyDetailBloc;
  final MapController mapController = MapController();

  @override
  void initState(BuildContext context) {
    super.initState(context);
    _fetchCompanyDetail();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
    BlocProvider<CompanyDetailBloc>.value(value: companyDetailBloc),
  ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
    BlocListener<CompanyDetailBloc, CompanyDetailState>(
      listener: _listenerCompanyDetailBloc,
    ),
  ];

  @override
  void dispose() {
    companyDetailBloc.close();
    mapController.dispose();
    super.dispose();
  }

  Future<void> _fetchCompanyDetail() async {
    // final token = await FlutterSecureStorageHelper.getToken();
    // debugPrint('TOKEN: $token');

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
        // debugPrint(
        //   'Company API response: '
        //   'id=${data?.id}, '
        //   'name=${data?.name}, '
        //   'lat=${data?.latitude}, '
        //   'lng=${data?.longitude}, '
        //   'radius=${data?.maxRadius}',
        // );
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
      // debugPrint(
      //   'MY POSITION: lat=${userLatLng.latitude}, lng=${userLatLng.longitude}',
      // );

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
