import 'dart:async';

import 'package:morpheme_base/morpheme_base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends MorphemeCubit<HomeStateCubit> {
  HomeCubit() : super(HomeStateCubit());

  Timer? timer;

  @override
  void initState(BuildContext context) {
    super.initState(context);
    emit(state.copyWith(dateTime: DateTime.now()));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state.copyWith(dateTime: DateTime.now()));
    });
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

  void getCurrentLocation() {}

  void onAttendancePressed(BuildContext context) {}
}
