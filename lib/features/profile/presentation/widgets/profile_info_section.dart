import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_radius.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/profile/domain/entities/profile_entity.dart';

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
          _buildItem(
            context,
            icon: Icons.badge,
            label: 'NIP',
            value: user.nip ?? '-',
          ),
          _buildDivider(context),
          _buildItem(
            context,
            icon: Icons.business,
            label: 'Division',
            value: user.division ?? '-',
          ),
          _buildDivider(context),
          _buildItem(
            context,
            icon: Icons.email,
            label: 'Email',
            value: user.email ?? '-',
          ),
          _buildDivider(context),
          _buildItem(
            context,
            icon: Icons.calendar_today,
            label: 'Joined',
            value: _formatDate(user.createdAt),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(height: 1, thickness: 1, color: context.color.border);
  }

  Widget _buildItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ConstantSizes.defaultPadding,
        vertical: ConstantSizes.s16,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(ConstantSizes.s8),
            decoration: BoxDecoration(
              color: context.color.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: context.color.primary, size: 20),
          ),
          const AtomSpacing.horizontal16(),
          AtomText.bodyMediumBold(label, color: context.color.white),
          const AtomSpacing.horizontal16(),
          Expanded(
            child: AtomText.bodyMedium(
              value,
              textAlign: TextAlign.end,
              color: context.color.white,
            ),
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
