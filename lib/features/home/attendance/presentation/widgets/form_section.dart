import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atoms.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/components/selfie_placeholder.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/cubit/attendance_cubit.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceStateCubit>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(ConstantSizes.s16),
          child: Column(
            spacing: ConstantSizes.s24,
            children: [
              SelfiePlaceholder(onTap: () {}),
              AtomButton.elevated(
                key: const Key('checkin_button'),
                text: 'Check In Masuk',
                onPressed: state.isInRadius ? () {} : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
