import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/organisms/attendance_card.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AttendanceCard Widget Tests', () {
    testWidgets('renders attendance status and times', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          SingleChildScrollView(
            child: AttendanceCard(onCheckOutPressed: () {}),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Status Absensi'), findsOneWidget);
      expect(find.text('08:00'), findsOneWidget);
      expect(find.text('--:--'), findsOneWidget);
      expect(find.text('JAM MASUK'), findsOneWidget);
      expect(find.text('JAM PULANG'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders badge and check-in status', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          SingleChildScrollView(
            child: AttendanceCard(onCheckOutPressed: () {}),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('SUDAH CHECK-IN'), findsOneWidget);
      expect(find.text('Tepat Waktu'), findsOneWidget);
      expect(find.text('Belum Absen'), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('Check Out button triggers callback', (tester) async {
      setTestScreenSize(tester);
      bool isCheckedOut = false;

      await tester.pumpWidget(
        createTestableWidget(
          SingleChildScrollView(
            child: AttendanceCard(onCheckOutPressed: () => isCheckedOut = true),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Check Out Sekarang'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Check Out Sekarang'));
      await tester.pump();

      expect(isCheckedOut, isTrue);
      resetTestScreenSize(tester);
    });
  });
}
