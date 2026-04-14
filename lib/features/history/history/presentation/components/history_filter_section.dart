import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_spacing.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_text.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/extensions/localization_extension.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';

class HistoryFilterSection extends StatelessWidget {
  const HistoryFilterSection({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final String selectedStatus;
  final ValueChanged<String?> onStatusChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AtomText.bodyMedium(
              context.s.period,
              color: context.color.white,
              fontWeight: FontWeight.bold,
            ),
            InkWell(
              onTap: () {
                onDateChanged(DateTime.now());
                onStatusChanged('all');
              },
              child: AtomText.bodyMedium(
                context.s.resetFilter,
                color: context.color.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const AtomSpacing.vertical8(),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  final pickedDate = await _showMonthYearPicker(
                    context,
                    selectedDate,
                  );
                  if (pickedDate != null) {
                    onDateChanged(pickedDate);
                  }
                },
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: context.color.fillTextField,
                    border: Border.all(color: context.color.primary),
                    borderRadius: BorderRadius.circular(ConstantSizes.s16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 20,
                              color: context.color.primary,
                            ),
                            const AtomSpacing.horizontal8(),
                            Expanded(
                              child: AtomText.bodyMedium(
                                DateFormat('MMM yyyy').format(selectedDate),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: context.color.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const AtomSpacing.horizontal12(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: context.color.fillTextField,
                  border: Border.all(color: context.color.primary),
                  borderRadius: BorderRadius.circular(ConstantSizes.s16),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedStatus,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: context.color.grey,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'all',
                        child: AtomText.bodyMedium(context.s.allStatus),
                      ),
                      DropdownMenuItem(
                        value: 'present',
                        child: AtomText.bodyMedium(context.s.onTime),
                      ),
                      DropdownMenuItem(
                        value: 'late',
                        child: AtomText.bodyMedium(context.s.late),
                      ),
                      DropdownMenuItem(
                        value: 'absent',
                        child: AtomText.bodyMedium(context.s.absent),
                      ),
                    ],
                    onChanged: onStatusChanged,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<DateTime?> _showMonthYearPicker(
    BuildContext context,
    DateTime currentSelectedDate,
  ) async {
    int tempYear = currentSelectedDate.year;

    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return showModalBottomSheet<DateTime>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext builderContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(ConstantSizes.defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          setState(() {
                            tempYear--;
                          });
                        },
                      ),
                      AtomText.bodyLarge(
                        tempYear.toString(),
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: tempYear < DateTime.now().year
                            ? () {
                                setState(() {
                                  tempYear++;
                                });
                              }
                            : null,
                      ),
                    ],
                  ),
                  const AtomSpacing.vertical16(),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 2,
                        ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      final monthDate = DateTime(tempYear, index + 1);
                      final isFuture = monthDate.isAfter(DateTime.now());
                      final isSelected =
                          tempYear == currentSelectedDate.year &&
                          index + 1 == currentSelectedDate.month;

                      return InkWell(
                        onTap: isFuture
                            ? null
                            : () {
                                Navigator.pop(
                                  context,
                                  DateTime(tempYear, index + 1),
                                );
                              },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? context.color.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isFuture
                                  ? context.color.bgGrey
                                  : context.color.primary,
                            ),
                          ),
                          child: AtomText.bodyMedium(
                            months[index],
                            color: isSelected
                                ? context.color.white
                                : isFuture
                                ? context.color.grey
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                  const AtomSpacing.vertical16(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
