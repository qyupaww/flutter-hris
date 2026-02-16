import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/atoms/atom_badge.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AtomBadge Widget Tests', () {
    testWidgets('renders badge with correct label', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AtomBadge(label: 'Active')),
      );
      await tester.pumpAndSettle();

      expect(find.text('Active'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders primary variant by default', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AtomBadge(label: 'Primary')),
      );
      await tester.pumpAndSettle();

      final badge = tester.widget<AtomBadge>(find.byType(AtomBadge));
      expect(badge.variant, AtomBadgeVariant.primary);
      resetTestScreenSize(tester);
    });

    testWidgets('renders success variant', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AtomBadge(label: 'Success', variant: AtomBadgeVariant.success),
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
          const AtomBadge(label: 'Warning', variant: AtomBadgeVariant.warning),
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
          const AtomBadge(label: 'Danger', variant: AtomBadgeVariant.danger),
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
          const AtomBadge(label: 'Neutral', variant: AtomBadgeVariant.neutral),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Neutral'), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
