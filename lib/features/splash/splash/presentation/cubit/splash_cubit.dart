import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_extension/morpheme_extension.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:morpheme_http/morpheme_http.dart';

part 'splash_state.dart';

class SplashCubit extends MorphemeCubit<SplashStateCubit> {
  SplashCubit() : super(SplashStateCubit());

  @override
  void initState(BuildContext context) {
    super.initState(context);
    locator<MorphemeInspector>().setNavigatorState(
      rootNavigatorKey.currentState ?? NavigatorState(),
    );
  }

  @override
  void initAfterFirstLayout(BuildContext context) async {
    await Future.delayed(2.seconds);

    final token = await FlutterSecureStorageHelper.getToken();
    if (token.isNullOrEmpty) {
      if (context.mounted) context.goNamed(ConstantRoutes.login);
    } else {
      if (context.mounted) context.goNamed(ConstantRoutes.home);
    }
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [];

  @override
  void dispose() {}
}
