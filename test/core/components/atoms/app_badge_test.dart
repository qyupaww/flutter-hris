import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/atoms/app_badge.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AppBadge Widget Tests', () {
    testWidgets('renders badge with correct label', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AppBadge(label: 'Active')),
      );
      await tester.pumpAndSettle();

      expect(find.text('Active'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders primary variant by default', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AppBadge(label: 'Primary')),
      );
      await tester.pumpAndSettle();

      final badge = tester.widget<AppBadge>(find.byType(AppBadge));
      expect(badge.variant, AppBadgeVariant.primary);
      resetTestScreenSize(tester);
    });

    testWidgets('renders success variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AppBadge(label: 'Success', variant: AppBadgeVariant.success),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Success'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders warning variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AppBadge(label: 'Warning', variant: AppBadgeVariant.warning),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Warning'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders danger variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AppBadge(label: 'Danger', variant: AppBadgeVariant.danger),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Danger'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders neutral variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AppBadge(label: 'Neutral', variant: AppBadgeVariant.neutral),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Neutral'), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
