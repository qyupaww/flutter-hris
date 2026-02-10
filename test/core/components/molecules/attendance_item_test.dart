import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hris/core/components/molecules/attendance_item.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  group('AttendanceItem Widget Tests', () {
    testWidgets('renders check-in item with label, time, and status', (
      tester,
    ) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AttendanceItem(
            label: 'JAM MASUK',
            time: '08:00',
            status: 'Tepat Waktu',
            isCheckIn: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('JAM MASUK'), findsOneWidget);
      expect(find.text('08:00'), findsOneWidget);
      expect(find.text('Tepat Waktu'), findsOneWidget);
      expect(find.byIcon(Icons.login_rounded), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('renders check-out item with logout icon', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AttendanceItem(
            label: 'JAM PULANG',
            time: '--:--',
            status: 'Belum Absen',
            isCheckIn: false,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('JAM PULANG'), findsOneWidget);
      expect(find.text('--:--'), findsOneWidget);
      expect(find.text('Belum Absen'), findsOneWidget);
      expect(find.byIcon(Icons.logout_rounded), findsOneWidget);
      resetTestScreenSize(tester);
    });

    testWidgets('defaults to check-in (isCheckIn = true)', (tester) async {
      setTestScreenSize(tester);
      await tester.pumpWidget(
        createTestableWidget(
          const AttendanceItem(
            label: 'JAM MASUK',
            time: '09:00',
            status: 'Terlambat',
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Default isCheckIn is true, so login icon should appear
      expect(find.byIcon(Icons.login_rounded), findsOneWidget);
      resetTestScreenSize(tester);
    });
  });
}
