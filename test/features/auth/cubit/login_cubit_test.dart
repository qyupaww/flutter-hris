import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/features/auth/presentations/pages/login_screen.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('LoginCubit (mixin) Tests', () {
    testWidgets('LoginScreen renders successfully with LoginCubit mixin', (
      tester,
    ) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidgetWithApp(const MaterialApp(home: LoginScreen())),
      );
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.text('Welcome Back'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('LoginScreen has email and password fields', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidgetWithApp(const MaterialApp(home: LoginScreen())),
      );
      await tester.pumpAndSettle();

      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
