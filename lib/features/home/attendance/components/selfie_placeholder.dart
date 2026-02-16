import 'package:flutter/material.dart';
import 'package:morpheme_cached_network_image/morpheme_cached_network_image.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_radius.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/components/selfie_label.dart';

class SelfiePlaceholder extends StatelessWidget {
  final VoidCallback onTap;
  final String? imageUrl;

  const SelfiePlaceholder({super.key, required this.onTap, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: ConstantSizes.s12,
      children: [
        SelfieLabel(),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(ConstantRadius.r16),
          child: Container(
            height: ConstantSizes.s80 * 3,
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.color.background,
              borderRadius: BorderRadius.circular(ConstantRadius.r16),
              border: Border.all(
                color: context.color.grey.withValues(alpha: 0.3),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: imageUrl != null
                ? MorphemeCachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: ConstantSizes.s12,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(ConstantSizes.s12),
                        decoration: BoxDecoration(
                          color: context.color.grey.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: context.color.white,
                          size: ConstantSizes.s24,
                        ),
                      ),
                      Column(
                        spacing: ConstantSizes.s4,
                        children: [
                          AtomText.bodyLargeSemiBold(
                            'Ketuk untuk ambil foto',
                            color: context.color.white,
                          ),
                          AtomText.bodySmall(
                            'Pastikan wajah terlihat jelas tanpa masker',
                            color: context.color.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
        AtomText.bodySmall(
          'Data lokasi dan foto anda akan disimpan aman untuk keperluan validasi absensi perusahaan.',
          color: context.color.grey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
