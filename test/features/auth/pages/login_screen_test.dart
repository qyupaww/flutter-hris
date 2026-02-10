import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/features/auth/presentations/widgets/login_form_section.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('LoginFormSection Widget Tests', () {
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
            body: LoginFormSection(
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

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('can enter email and password', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Enter your email address'),
        'test@example.com',
      );
      expect(emailController.text, 'test@example.com');

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Enter your password'),
        'password123',
      );
      expect(passwordController.text, 'password123');
      resetTestScreenSize(tester);
    });

    testWidgets('Login button triggers onLoginPressed callback', (
      tester,
    ) async {
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

    testWidgets('Register button triggers onRegisterPressed callback', (
      tester,
    ) async {
      setTestScreenSize(tester);
      bool registerPressed = false;

      await tester.pumpWidget(
        createWidget(onRegisterPressed: () => registerPressed = true),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Register'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Register'));
      await tester.pump();

      expect(registerPressed, isTrue);
      resetTestScreenSize(tester);
    });

    testWidgets('password visibility toggle works', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
