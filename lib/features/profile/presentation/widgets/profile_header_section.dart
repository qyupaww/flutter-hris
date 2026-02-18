import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/profile/domain/entities/profile_entity.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key, required this.user});

  final DataProfile user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AtomSpacing.vertical16(),
        CircleAvatar(
          radius: 50,
          backgroundImage: user.avatarUrl != null && user.avatarUrl!.isNotEmpty
              ? NetworkImage(user.avatarUrl!)
              : null,
          backgroundColor: context.color.bgGrey,
          child: user.avatarUrl == null || user.avatarUrl!.isEmpty
              ? Icon(Icons.person, size: 50, color: context.color.grey)
              : null,
        ),
        const AtomSpacing.vertical16(),
        AtomText.heading2(user.fullName ?? '-', textAlign: TextAlign.center),
        const AtomSpacing.vertical4(),
        AtomText.bodyMedium(
          user.role ?? '-',
          color: context.color.grey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
