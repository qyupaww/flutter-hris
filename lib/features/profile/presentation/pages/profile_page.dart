import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:morpheme_flutter_lite/features/profile/presentation/widgets/widgets.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with MorphemeStatePage<ProfilePage, ProfileCubit> {
  @override
  ProfileCubit setCubit() => locator<ProfileCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AtomText.bodyLarge('Profile', fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: context.color.background,
        elevation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileStateCubit>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.failure != null && state.profile == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AtomText.bodyMedium(
                    state.failure?.message ?? 'Unknown error',
                    color: context.color.error,
                  ),
                  const AtomSpacing.vertical16(),
                  AtomButton.elevated(
                    text: 'Retry',
                    onPressed: () =>
                        context.read<ProfileCubit>().fetchProfile(),
                  ),
                ],
              ),
            );
          }

          final user = state.profile?.data;
          if (user == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(ConstantSizes.defaultPadding),
            child: Column(
              children: [
                ProfileHeaderSection(user: user),
                const AtomSpacing.vertical32(),
                ProfileInfoSection(user: user),
                const AtomSpacing.vertical16(),
                AtomButton.elevated(
                  key: const Key('logout_button'),
                  text: 'Logout',
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
                  'Nafanesia Work',
                  textAlign: TextAlign.center,
                  color: context.color.grey,
                ),
                AtomText.bodySmall(
                  'v1.0.0 (Build 2026.01.05)',
                  textAlign: TextAlign.center,
                  color: context.color.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
