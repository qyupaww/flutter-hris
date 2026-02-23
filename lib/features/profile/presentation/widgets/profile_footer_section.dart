import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';

import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/l10n/s.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileFooterSection extends StatelessWidget {
  const ProfileFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomButton.elevated(
          key: const Key('logout_button'),
          text: S.of(context)?.logoutButton ?? 'Logout',
          onPressed: () =>
              context.read<ProfileCubit>().onLogoutPressed(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: context.color.bgError,
            foregroundColor: context.color.error,
            minimumSize: const Size(
              double.infinity,
              ConstantSizes.heightButton,
            ),
          ),
        ),
        const AtomSpacing.vertical16(),
        AtomText.bodyMediumBold(
          S.of(context)?.nafanesiaWork ?? 'Nafanesia Work',
          textAlign: TextAlign.center,
          color: context.color.grey,
        ),
        AtomText.bodySmall(
          'v1.0.0 (Build 2026.01.05)',
          textAlign: TextAlign.center,
          color: context.color.grey,
        ),
      ],
    );
  }
}
