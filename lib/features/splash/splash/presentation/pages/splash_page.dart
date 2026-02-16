import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/assets/assets.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/morpheme_colors.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atoms.dart';
import 'package:morpheme_flutter_lite/core/extensions/localization_extension.dart';

import '../cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with MorphemeStatePage<SplashPage, SplashCubit> {
  @override
  SplashCubit setCubit() => locator<SplashCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: context.color.primary.withValues(alpha: 0.3),
                    blurRadius: 100,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: AtomImage.asset(MorphemeImages.splash),
            ),
            const AtomSpacing.vertical24(),
            AtomText.heading1(context.s.nafanesiaWork),
            AtomText.bodyLarge(
              context.s.engineeringExcellence.toUpperCase(),
              color: context.color.grey,
            ),
          ],
        ),
      ),
    );
  }
}
