import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atoms.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_radius.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/extensions/localization_extension.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/home/home/presentation/cubit/home_cubit.dart';

class AttendanceSection extends StatelessWidget {
  const AttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStateCubit>(
      builder: (context, state) {
        final String badgeText;
        if (state.isCheckedIn && state.isCheckedOut) {
          badgeText = context.s.alreadyAttended;
        } else if (state.isCheckedIn) {
          badgeText = context.s.alreadyCheckedIn;
        } else {
          badgeText = context.s.notAttendedYet;
        }

        final checkInTime = state.checkInTime ?? '--:--';
        final checkOutTime = state.checkOutTime ?? '--:--';
        final checkInStatus = state.isCheckedIn
            ? (state.checkInStatus ??
                  (context.s.alreadyAttended))
            : (context.s.notAttendedYet);
        final checkOutStatus = state.isCheckedOut
            ? (state.checkOutStatus ??
                  (context.s.alreadyCheckedOut))
            : (context.s.notAttendedYet);

        final String buttonText;
        final VoidCallback? onPressed;
        if (state.isCheckedIn && state.isCheckedOut) {
          buttonText =
              context.s.alreadyAttendedToday;
          onPressed = null;
        } else if (state.isCheckedIn) {
          buttonText = context.s.checkOutNow;
          onPressed = () =>
              context.read<HomeCubit>().onAttendancePressed(context);
        } else {
          buttonText = context.s.checkInNow;
          onPressed = () =>
              context.read<HomeCubit>().onAttendancePressed(context);
        }

        return Container(
          decoration: BoxDecoration(
            color: context.color.fillTextField,
            borderRadius: BorderRadius.circular(ConstantRadius.r12),
            border: Border.all(color: context.color.border),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(ConstantSizes.s16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AtomText.bodyMediumBold(
                      context.s.statusAttendance,
                    ),
                    AtomBadge.primary(text: badgeText),
                  ],
                ),
              ),
              Divider(color: context.color.border, height: 1),
              Padding(
                padding: EdgeInsets.all(ConstantSizes.s16),
                child: Column(
                  spacing: ConstantSizes.s16,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        spacing: ConstantSizes.s16,
                        children: [
                          Expanded(
                            child: _StatusAttendance(
                              title: context.s.timeInTitle,
                              time: checkInTime,
                              status: checkInStatus,
                            ),
                          ),
                          VerticalDivider(
                            color: context.color.border,
                            width: 1,
                          ),
                          Expanded(
                            child: _StatusAttendance(
                              title:
                                  context.s.timeOutTitle,
                              time: checkOutTime,
                              status: checkOutStatus,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AtomButton.elevated(text: buttonText, onPressed: onPressed),
                    AtomText.bodySmall(
                      context.s.attendanceWarning,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatusAttendance extends StatelessWidget {
  const _StatusAttendance({
    required this.title,
    required this.time,
    required this.status,
  });

  final String title;
  final String time;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: ConstantSizes.s8,
      children: [
        Row(
          spacing: ConstantSizes.s8,
          children: [
            Icon(Icons.login, color: context.color.grey),
            Expanded(child: AtomText.bodyMediumBold(title)),
          ],
        ),
        AtomText.heading2(time),
        AtomText.bodySmall(status, color: context.color.grey),
      ],
    );
  }
}
