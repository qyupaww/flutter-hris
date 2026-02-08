import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constant_routes.dart';
import '../pages/splash_screen.dart';

mixin SplashCubit on State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // initAfterLayout
    WidgetsBinding.instance.endOfFrame.then((value) async {
      await Future.delayed(Duration(seconds: 1));

      if (mounted) context.go(ConstantRoutes.login);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
