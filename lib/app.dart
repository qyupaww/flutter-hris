import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/app_config.dart';
import 'routes/routes.dart';
import 'utils/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ScreenUtilInit(
          designSize: orientation == Orientation.portrait
              ? const Size(375, 812)
              : const Size(812, 375),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) {
            return ValueListenableBuilder<ThemeMode>(
              valueListenable: ThemeManager().themeMode,
              builder: (context, themeMode, _) {
                return MaterialApp.router(
                  title: 'Flutter HRIS',
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeMode,
                  routerConfig: Routes.routerConfig,
                );
              },
            );
          },
        );
      },
    );
  }
}
