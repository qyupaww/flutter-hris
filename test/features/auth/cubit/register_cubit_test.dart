import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/features/auth/presentations/pages/register_screen.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('RegisterCubit (mixin) Tests', () {
    testWidgets(
      'RegisterScreen renders successfully with RegisterCubit mixin',
      (tester) async {
        setTestScreenSize(tester);
        await tester.pumpWidget(
          createTestableWidgetWithApp(
            const MaterialApp(home: RegisterScreen()),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(RegisterScreen), findsOneWidget);
        expect(find.text('Create Account'), findsOneWidget);
        resetTestScreenSize(tester);
      },
    );

    testWidgets('RegisterScreen has all form fields', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidgetWithApp(const MaterialApp(home: RegisterScreen())),
      );
      await tester.pumpAndSettle();

      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Register'), findsAtLeast(1));
      resetTestScreenSize(tester);
    });
  });
}
