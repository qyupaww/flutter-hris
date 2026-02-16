import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:morpheme_base/morpheme_base.dart';

part 'attendance_state.dart';

class AttendanceCubit extends MorphemeCubit<AttendanceStateCubit> {
  AttendanceCubit() : super(const AttendanceStateCubit());

  final MapController mapController = MapController();

  @override
  void initState(BuildContext context) {
    super.initState(context);
    fetchCurrentLocation();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [];

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
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

      final distance = Geolocator.distanceBetween(
        userLatLng.latitude,
        userLatLng.longitude,
        state.officePosition.latitude,
        state.officePosition.longitude,
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
