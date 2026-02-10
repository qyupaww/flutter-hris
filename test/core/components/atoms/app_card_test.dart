import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/atoms/app_card.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AppCard Widget Tests', () {
    testWidgets('renders child widget inside card', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(const AppCard(child: Text('Card Content'))),
      );
      await tester.pumpAndSettle();

      expect(find.text('Card Content'), findsOneWidget);
      expect(find.byType(AppCard), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders with custom padding', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AppCard(
            padding: EdgeInsets.all(32),
            child: Text('Padded Content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Padded Content'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders complex child widget', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          AppCard(
            child: Column(children: const [Text('Title'), Text('Subtitle')]),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
