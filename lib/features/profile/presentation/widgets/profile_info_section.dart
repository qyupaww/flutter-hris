import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_radius.dart';
import 'package:morpheme_flutter_lite/core/l10n/s.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/profile/domain/entities/profile_entity.dart';
import 'package:morpheme_flutter_lite/features/profile/presentation/components/profile_info_item.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key, required this.user});

  final DataProfile user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.fillTextField,
        borderRadius: BorderRadius.circular(ConstantRadius.r16),
        border: Border.all(color: context.color.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ProfileInfoItem(
            icon: Icons.badge,
            label: S.of(context)?.profileNip ?? 'NIP',
            value: user.nip ?? '-',
          ),
          Divider(height: 1, thickness: 1, color: context.color.border),
          ProfileInfoItem(
            icon: Icons.business,
            label: S.of(context)?.profileDivision ?? 'Divisi',
            value: user.division ?? '-',
          ),
          Divider(height: 1, thickness: 1, color: context.color.border),
          ProfileInfoItem(
            icon: Icons.email,
            label: S.of(context)?.profileEmail ?? 'Email',
            value: user.email ?? '-',
          ),
          Divider(height: 1, thickness: 1, color: context.color.border),
          ProfileInfoItem(
            icon: Icons.calendar_today,
            label: S.of(context)?.profileJoined ?? 'Bergabung',
            value: _formatDate(user.createdAt),
          ),
        ],
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return '-';
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('MMMM yyyy', 'id_ID').format(date);
    } catch (_) {
      return dateStr;
    }
  }
}
