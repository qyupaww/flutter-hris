import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_cached_network_image/morpheme_cached_network_image.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/home/home/presentation/cubit/home_cubit.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((HomeCubit cubit) => cubit.state.user);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: ConstantSizes.s2,
            children: [
              AtomText.bodyMedium('Selamat Datang', color: context.color.grey),
              AtomText.heading2(user?.fullName ?? '-'),
              AtomBadge.primary(text: user?.division ?? '-'),
            ],
          ),
        ),
        SizedBox(
          width: ConstantSizes.s48,
          height: ConstantSizes.s48,
          child: Stack(
            children: [
              ClipOval(
                child: MorphemeCachedNetworkImage(
                  imageUrl: 'https://picsum.photos/200/200',
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: ConstantSizes.s8,
                  height: ConstantSizes.s8,
                  decoration: BoxDecoration(
                    color: context.color.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: context.color.background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
