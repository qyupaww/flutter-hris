import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_icon.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_text.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_radius.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/morpheme_colors.dart';
import 'package:morpheme_flutter_lite/features/home/home/presentation/cubit/home_cubit.dart';

class CurrentLocationSection extends StatelessWidget {
  const CurrentLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final address = context.select(
      (HomeCubit element) => element.state.address,
    );
    final isLoadingLocation = context.select(
      (HomeCubit element) => element.state.isLoadingLocation,
    );

    return Container(
      padding: EdgeInsets.all(ConstantSizes.s16),
      decoration: BoxDecoration(
        color: context.color.fillTextField,
        borderRadius: BorderRadius.circular(ConstantRadius.r12),
        border: Border.all(color: context.color.border),
      ),
      child: Row(
        spacing: ConstantSizes.s16,
        children: [
          AtomIcon.primary(icon: Icons.navigation, angle: 45),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: ConstantSizes.s2,
              children: [
                AtomText.bodySmall(
                  'LOKASI SAAT INI',
                  color: context.color.grey,
                ),
                if (isLoadingLocation)
                  const AtomText.bodySmall('Mencari lokasi...')
                else
                  AtomText.bodySmall(
                    address ?? 'Lokasi belum ditemukan',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          if (isLoadingLocation)
            SizedBox(
              width: ConstantSizes.s24,
              height: ConstantSizes.s24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            IconButton(
              onPressed: () => context.read<HomeCubit>().getCurrentLocation(),
              icon: Icon(Icons.refresh),
              color: context.color.white,
            ),
        ],
      ),
    );
  }
}
