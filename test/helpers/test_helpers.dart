import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

const Size kTestDesignSize = Size(375, 812);

Widget createTestableWidget(Widget child) {
  return ScreenUtilInit(
    designSize: kTestDesignSize,
    minTextAdapt: true,
    builder: (context, _) {
      return MaterialApp(home: Scaffold(body: child));
    },
  );
}

Widget createTestableWidgetWithApp(Widget app) {
  return ScreenUtilInit(
    designSize: kTestDesignSize,
    minTextAdapt: true,
    builder: (context, _) {
      return app;
    },
  );
}

void setTestScreenSize(WidgetTester tester) {
  tester.view.physicalSize = kTestDesignSize;
  tester.view.devicePixelRatio = 1.0;
}

void resetTestScreenSize(WidgetTester tester) {
  tester.view.resetPhysicalSize();
  tester.view.resetDevicePixelRatio();
}
