import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/atoms/atom_icon_badge.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AtomIconBox Widget Tests', () {
    testWidgets('renders icon correctly', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AtomIconBox(icon: Icons.access_time)),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.access_time), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders primary variant by default', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AtomIconBox(icon: Icons.home)),
      );
      await tester.pumpAndSettle();

      final iconBox = tester.widget<AtomIconBox>(find.byType(AtomIconBox));
      expect(iconBox.variant, AtomIconVariant.primary);
      resetTestScreenSize(tester);
    });

    testWidgets('renders success variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AtomIconBox(
            icon: Icons.check,
            variant: AtomIconVariant.success,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders warning variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AtomIconBox(
            icon: Icons.warning,
            variant: AtomIconVariant.warning,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.warning), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders danger variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AtomIconBox(icon: Icons.error, variant: AtomIconVariant.danger),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.error), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders neutral variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AtomIconBox(icon: Icons.info, variant: AtomIconVariant.neutral),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.info), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
