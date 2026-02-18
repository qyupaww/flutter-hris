import 'package:equatable/equatable.dart';
import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/core/extensions/build_context_extension.dart';

import '../bloc/logout/logout_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends MorphemeCubit<ProfileStateCubit> {
  ProfileCubit({required this.logoutBloc}) : super(ProfileStateCubit());

  final LogoutBloc logoutBloc;

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
    BlocProvider<LogoutBloc>.value(value: logoutBloc),
  ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
    BlocListener<LogoutBloc, LogoutState>(listener: _listenerLogoutBloc),
  ];

  @override
  void dispose() {
    logoutBloc.close();
    super.dispose();
  }

  void onLogoutPressed(BuildContext context) {
    logoutBloc.add(FetchLogout());
  }

  void _listenerLogoutBloc(BuildContext context, LogoutState state) {
    state.when(
      onLoading: (state) => context.showSnackBar(
        MorphemeSnackBar.success(
          context: context,
          key: const Key('logout_loading'),
          message: 'Logging out...',
        ),
      ),
      onFailed: (state) async {
        await _clearAndRedirect(context);
      },
      onSuccess: (state) async {
        await _clearAndRedirect(context);
      },
    );
  }

  Future<void> _clearAndRedirect(BuildContext context) async {
    await FlutterSecureStorageHelper.removeToken();
    await FlutterSecureStorageHelper.removeUser();
    if (context.mounted) {
      context.goNamed(ConstantRoutes.login);
    }
  }
}
