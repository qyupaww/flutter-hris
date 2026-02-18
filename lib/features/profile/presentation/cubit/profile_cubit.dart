import 'package:equatable/equatable.dart';
import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/core/extensions/build_context_extension.dart';
import 'package:morpheme_flutter_lite/features/profile/domain/entities/profile_entity.dart';
import 'package:morpheme_flutter_lite/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:morpheme_http/morpheme_http.dart';

import '../bloc/logout/logout_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends MorphemeCubit<ProfileStateCubit> {
  ProfileCubit({required this.logoutBloc, required this.getProfileUseCase})
    : super(const ProfileStateCubit());

  final LogoutBloc logoutBloc;
  final GetProfileUseCase getProfileUseCase;

  @override
  void initState(BuildContext context) {
    super.initState(context);
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    emit(state.copyWith(isLoading: true));
    final result = await getProfileUseCase(null);
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (profile) => emit(state.copyWith(isLoading: false, profile: profile)),
    );
  }

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
