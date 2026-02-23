import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/global_cubit/global_cubit.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_themes/morpheme_themes.dart';

class ProfileThemeSwitcher extends StatelessWidget {
  const ProfileThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.fillTextField,
        borderRadius: BorderRadius.circular(ConstantSizes.defaultPadding),
      ),
      child: ListTile(
        leading: Icon(
          context.select(
                (GlobalCubit bloc) => bloc.state.theme is MorphemeThemeDark,
              )
              ? Icons.dark_mode
              : Icons.light_mode,
          color: context.color.primary,
        ),
        title: AtomText.bodyMediumBold(
          context.select(
                (GlobalCubit bloc) => bloc.state.theme is MorphemeThemeDark,
              )
              ? 'Dark Mode'
              : 'Light Mode',
        ),
        trailing: Switch(
          value: context.select(
            (GlobalCubit bloc) => bloc.state.theme is MorphemeThemeDark,
          ),
          activeTrackColor: context.color.primary,
          onChanged: (value) {
            if (value) {
              context.read<GlobalCubit>().changeTheme(MorphemeThemeDark());
            } else {
              context.read<GlobalCubit>().changeTheme(MorphemeThemeLight());
            }
          },
        ),
      ),
    );
  }
}
