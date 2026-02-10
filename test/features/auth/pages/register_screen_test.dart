import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/features/auth/presentations/widgets/register_form_section.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('RegisterFormSection Widget Tests', () {
    late TextEditingController emailController;
    late TextEditingController passwordController;

    setUp(() {
      emailController = TextEditingController();
      passwordController = TextEditingController();
    });

    tearDown(() {
      emailController.dispose();
      passwordController.dispose();
    });

    Widget createWidget({
      VoidCallback? onLoginPressed,
      VoidCallback? onRegisterPressed,
    }) {
      return createTestableWidgetWithApp(
        MaterialApp(
          home: Scaffold(
            body: RegisterFormSection(
              emailController: emailController,
              passwordController: passwordController,
              onLoginPressed: onLoginPressed ?? () {},
              onRegisterPressed: onRegisterPressed ?? () {},
            ),
          ),
        ),
      );
    }

    testWidgets('renders all form elements', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle();

      expect(find.text('Create Account'), findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Company'), findsOneWidget);
      expect(find.text('NIP'), findsOneWidget);
      expect(find.text('Division'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('Register button triggers onRegisterPressed callback', (
      tester,
    ) async {
      setTestScreenSize(tester);
      bool registerPressed = false;

      await tester.pumpWidget(
        createWidget(onRegisterPressed: () => registerPressed = true),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Register').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Register').first);
      await tester.pump();

      expect(registerPressed, isTrue);
      resetTestScreenSize(tester);
    });

    testWidgets('Login link triggers onLoginPressed callback', (tester) async {
      setTestScreenSize(tester);
      bool loginPressed = false;

      await tester.pumpWidget(
        createWidget(onLoginPressed: () => loginPressed = true),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Login'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Login'));
      await tester.pump();

      expect(loginPressed, isTrue);
      resetTestScreenSize(tester);
    });

    testWidgets('password visibility toggle works', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byIcon(Icons.visibility));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
