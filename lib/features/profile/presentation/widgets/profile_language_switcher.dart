import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';

import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/global_cubit/global_cubit.dart';
import 'package:morpheme_flutter_lite/core/extensions/localization_extension.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';

class ProfileLanguageSwitcher extends StatelessWidget {
  const ProfileLanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.fillTextField,
        borderRadius: BorderRadius.circular(ConstantSizes.defaultPadding),
      ),
      child: ListTile(
        leading: Icon(Icons.language, color: context.color.primary),
        title: AtomText.bodyMediumBold(context.s.language),
        trailing: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: context.select(
              (GlobalCubit bloc) => bloc.state.locale.languageCode,
            ),
            dropdownColor: context.color.background,
            borderRadius: BorderRadius.circular(ConstantSizes.s8),
            items: const [
              DropdownMenuItem(value: 'id', child: Text('Indonesian (ID)')),
              DropdownMenuItem(value: 'en', child: Text('English (EN)')),
            ],
            onChanged: (String? newLanguageCode) {
              if (newLanguageCode != null) {
                context.read<GlobalCubit>().changeLocale(
                  Locale(newLanguageCode),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
