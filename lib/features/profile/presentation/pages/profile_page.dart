import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/features/profile/presentation/cubit/profile_cubit.dart';
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
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            AtomButton.elevated(
              key: const Key('logout_button'),
              text: 'Logout',
              onPressed: () =>
                  context.read<ProfileCubit>().onLogoutPressed(context),
            ),
          ],
        ),
      ),
    );
  }
}
