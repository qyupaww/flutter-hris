import 'package:go_router/go_router.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../pages/main_page.dart';

part 'main_state.dart';

class MainCubit extends MorphemeCubit<MainStateCubit> {
  MainCubit() : super(MainStateCubit());

  StatefulNavigationShell? navigationShell;

  @override
  void initArgument<T>(BuildContext context, T widget) {
    super.initArgument(context, widget);
    if (widget is! MainPage) return;

    navigationShell = widget.navigationShell;
  }

  @override
  void didUpdateWidget<T>(BuildContext context, T oldWidget, T widget) {
    super.didUpdateWidget(context, oldWidget, widget);
    if (widget is! MainPage) return;

    navigationShell = widget.navigationShell;
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [];

  void onBottomNavigationBarPressed(int value) {
    navigationShell?.goBranch(value);
  }
}
