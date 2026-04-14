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
        final cubit = context.read<AttendanceCubit>();

        return Padding(
          padding: const EdgeInsets.all(ConstantSizes.s16),
          child: Column(
            spacing: ConstantSizes.s24,
            children: [
              SelfiePlaceholder(
                onTap: state.isCheckedIn && state.isCheckedOut
                    ? () {}
                    : () => cubit.takeSelfie(),
                imageFile: state.selfieFile,
              ),
              _buildActionButton(context, state, cubit),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    AttendanceStateCubit state,
    AttendanceCubit cubit,
  ) {
    if (state.isCheckedIn && state.isCheckedOut) {
      return AtomButton.elevated(
        key: const Key('attendance_done_button'),
        text: 'Sudah Absen Hari Ini',
        onPressed: null,
      );
    }

    if (state.isCheckedIn) {
      return AtomButton.elevated(
        key: const Key('checkout_button'),
        text: state.isSubmitting ? 'Mengirim...' : 'Check Out',
        onPressed: state.canCheckOut && !state.isSubmitting
            ? () => cubit.doCheckOut()
            : null,
      );
    }

    return AtomButton.elevated(
      key: const Key('checkin_button'),
      text: state.isSubmitting ? 'Mengirim...' : 'Check In Masuk',
      onPressed: state.canCheckIn && !state.isSubmitting
          ? () => cubit.doCheckIn()
          : null,
    );
  }
}
