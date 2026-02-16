import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:morpheme_flutter_lite/features/auth/login/domain/entities/login_entity.dart';

part 'home_state.dart';

class HomeCubit extends MorphemeCubit<HomeStateCubit> {
  HomeCubit() : super(HomeStateCubit());

  Timer? timer;

  @override
  void initState(BuildContext context) {
    super.initState(context);
    _getUser();
    getCurrentLocation();
    emit(state.copyWith(dateTime: DateTime.now()));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state.copyWith(dateTime: DateTime.now()));
    });
  }

  void _getUser() async {
    final user = await FlutterSecureStorageHelper.getUser();
    if (user != null) {
      emit(
        state.copyWith(
          user: UserLogin(
            id: user.id,
            email: user.email,
            avatarUrl: user.avatarUrl,
            companyId: user.companyId,
            createdAt: user.createdAt,
            division: user.division,
            fullName: user.fullName,
            nip: user.nip,
            role: user.role,
            updatedAt: user.updatedAt,
          ),
        ),
      );
    }
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [];

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void getCurrentLocation() async {
    try {
      emit(state.copyWith(isLoadingLocation: true));

      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            isLoadingLocation: false,
            address: 'Location services are disabled.',
          ),
        );
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
            state.copyWith(
              isLoadingLocation: false,
              address: 'Location permissions are denied',
            ),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            isLoadingLocation: false,
            address:
                'Location permissions are permanently denied, we cannot request permissions.',
          ),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final address = '${place.subLocality}, ${place.subAdministrativeArea}';
        emit(state.copyWith(address: address, isLoadingLocation: false));
      } else {
        emit(
          state.copyWith(
            address: 'Location not found',
            isLoadingLocation: false,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(address: e.toString(), isLoadingLocation: false));
    }
  }

  void onAttendancePressed(BuildContext context) {
    context.goNamed(ConstantRoutes.attendance);
  }
}
