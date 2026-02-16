import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/atoms/atom_custom_button.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AtomButton Widget Tests', () {
    testWidgets('renders AtomButton with correct label', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          AtomButton(label: 'Test Button', onPressed: () {}),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Button'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('triggers onPressed callback when tAtomed', (tester) async {
      setTestScreenSize(tester);
      bool isPressed = false;

      await tester.pumpWidget(
        createTestableWidget(
          AtomButton(label: 'Test Button', onPressed: () => isPressed = true),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Test Button'));
      await tester.pump();

      expect(isPressed, isTrue);
      resetTestScreenSize(tester);
    });

    testWidgets('renders primary variant as ElevatedButton by default', (
      tester,
    ) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(AtomButton(label: 'Primary', onPressed: () {})),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders secondary variant as OutlinedButton', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          AtomButton(
            label: 'Secondary',
            onPressed: () {},
            variant: AtomButtonVariant.secondary,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OutlinedButton), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders tertiary variant as TextButton', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          AtomButton(
            label: 'Tertiary',
            onPressed: () {},
            variant: AtomButtonVariant.tertiary,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TextButton), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
