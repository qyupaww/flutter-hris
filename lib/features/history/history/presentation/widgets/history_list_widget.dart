import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_button.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_spacing.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_text.dart';
import 'package:morpheme_flutter_lite/core/components/molecules/molecule_empty_state.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/extensions/localization_extension.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/entities/history_entity.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/components/history_attendance_item.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/components/history_filter_section.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/components/history_summary_section.dart';

class HistoryListWidget extends StatelessWidget {
  const HistoryListWidget({
    super.key,
    this.historyData,
    required this.selectedDate,
    required this.onDateChanged,
    required this.selectedStatus,
    required this.onStatusChanged,
    this.isLoading = false,
    this.errorMessage,
    this.onRetry,
  });

  final List<DataHistory>? historyData;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final String selectedStatus;
  final ValueChanged<String?> onStatusChanged;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    int presentCount = 0;
    int lateCount = 0;
    int absentCount = 0;

    List<DataHistory> filteredData = [];

    if (historyData != null) {
      for (var data in historyData!) {
        final status = data.status?.toLowerCase() ?? '';
        if (status == 'on time' || status == 'on_time' || status == 'present') {
          presentCount++;
        } else if (status == 'late') {
          lateCount++;
        } else if (status == 'absent') {
          absentCount++;
        }

        if (selectedStatus == 'all') {
          filteredData.add(data);
        } else if (selectedStatus == 'present' &&
            (status == 'on time' ||
                status == 'on_time' ||
                status == 'present')) {
          filteredData.add(data);
        } else if (selectedStatus == 'late' && status == 'late') {
          filteredData.add(data);
        } else if (selectedStatus == 'absent' && status == 'absent') {
          filteredData.add(data);
        }
      }
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(ConstantSizes.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HistoryFilterSection(
            selectedDate: selectedDate,
            onDateChanged: onDateChanged,
            selectedStatus: selectedStatus,
            onStatusChanged: onStatusChanged,
          ),
          const AtomSpacing.vertical20(),

          HistorySummarySection(
            presentCount: presentCount,
            lateCount: lateCount,
            absentCount: absentCount,
          ),
          const AtomSpacing.vertical20(),

          AtomText.bodyLarge(
            context.s.attendanceSummary,
            fontWeight: FontWeight.bold,
          ),
          const AtomSpacing.vertical16(),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (errorMessage != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AtomText.bodyMedium(
                      errorMessage!,
                      color: context.color.error,
                      textAlign: TextAlign.center,
                    ),
                    const AtomSpacing.vertical16(),
                    AtomButton.elevated(
                      text: context.s.retry,
                      onPressed: onRetry,
                    ),
                  ],
                ),
              ),
            )
          else if (filteredData.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: MoleculeEmptyState(
                  text: context.s.emptyStateTitle,
                  description: context.s.emptyStateDescription,
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredData.length,
              separatorBuilder: (context, index) =>
                  const AtomSpacing.vertical12(),
              itemBuilder: (context, index) {
                return HistoryAttendanceItem(data: filteredData[index]);
              },
            ),
        ],
      ),
    );
  }
}
