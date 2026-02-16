import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/molecules/molecule_input.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AppInput Widget Tests', () {
    testWidgets('renders AppInput with label and hint', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          AppInput(
            label: 'Email Label',
            hint: 'Email Hint',
            controller: TextEditingController(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Email Label'), findsOneWidget);
      expect(find.text('Email Hint'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('AppInput accepts text input', (tester) async {
      setTestScreenSize(tester);
      final controller = TextEditingController();

      await tester.pumpWidget(
        createTestableWidget(
          AppInput(label: 'Email', hint: 'Enter email', controller: controller),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), 'test@example.com');
      expect(controller.text, 'test@example.com');
      resetTestScreenSize(tester);
    });

    testWidgets('AppInput renders with obscured text', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          AppInput(
            label: 'Password',
            hint: 'Enter Password',
            controller: TextEditingController(),
            obscureText: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
      resetTestScreenSize(tester);
    });

    testWidgets('AppInput renders suffix icon when provided', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          AppInput(
            label: 'Password',
            hint: 'Enter Password',
            controller: TextEditingController(),
            obscureText: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
