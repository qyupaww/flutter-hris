import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atoms.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/cubit/attendance_cubit.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/widgets/widgets.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage>
    with MorphemeStatePage<AttendancePage, AttendanceCubit> {
  @override
  AttendanceCubit setCubit() => locator<AttendanceCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: AppBar(
        title: const AtomText.bodyLarge(
          'Verifikasi Kehadiran',
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: context.color.background,
        elevation: 0,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [MapSection(), FormSection()]),
        ),
      ),
    );
  }
}
