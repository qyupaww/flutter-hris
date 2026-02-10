import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/atoms/app_icon_badge.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AppIconBox Widget Tests', () {
    testWidgets('renders icon correctly', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AppIconBox(icon: Icons.access_time)),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.access_time), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders primary variant by default', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AppIconBox(icon: Icons.home)),
      );
      await tester.pumpAndSettle();

      final iconBox = tester.widget<AppIconBox>(find.byType(AppIconBox));
      expect(iconBox.variant, AppIconVariant.primary);
      resetTestScreenSize(tester);
    });

    testWidgets('renders success variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AppIconBox(icon: Icons.check, variant: AppIconVariant.success),
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
          const AppIconBox(
            icon: Icons.warning,
            variant: AppIconVariant.warning,
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
          const AppIconBox(icon: Icons.error, variant: AppIconVariant.danger),
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
          const AppIconBox(icon: Icons.info, variant: AppIconVariant.neutral),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.info), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
