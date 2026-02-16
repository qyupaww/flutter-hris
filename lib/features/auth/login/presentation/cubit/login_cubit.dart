// ignore_for_file: unnecessary_overrides

import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/extensions/morpheme_failure_extension.dart';
import 'package:morpheme_flutter_lite/features/auth/login/data/models/body/login_body.dart';
import 'package:morpheme_flutter_lite/features/auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:morpheme_flutter_lite/features/auth/login/data/models/response/login_response.dart'
    as model;

import '../pages/login_page.dart';

part 'login_state.dart';

class LoginCubit extends MorphemeCubit<LoginStateCubit> {
  LoginCubit({required this.loginBloc}) : super(LoginStateCubit());

  final LoginBloc loginBloc;

  final emailKey = GlobalKey<MoleculeTextFieldState>();
  final passwordKey = GlobalKey<MoleculeTextFieldState>();

  @override
  void initState(BuildContext context) {
    super.initState(context);
  }

  @override
  void initAfterFirstLayout(BuildContext context) {
    super.initAfterFirstLayout(context);
  }

  @override
  void initArgument<T>(BuildContext context, T widget) {
    super.initArgument(context, widget);
    if (widget is! LoginPage) return;
  }

  @override
  void didChangeDependencies(BuildContext context) {
    super.didChangeDependencies(context);
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
    BlocProvider<LoginBloc>.value(value: loginBloc),
  ];
  @override
  List<BlocListener> blocListeners(BuildContext context) => [
    BlocListener<LoginBloc, LoginState>(listener: listenerLoginBloc),
  ];
  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  void onLoginPressed(BuildContext context) {
    if (emailKey.validate() && passwordKey.validate()) {
      fetchLogin();
    }
  }

  void onRegisterPressed(BuildContext context) {
    context.pushNamed(ConstantRoutes.register);
  }

  void fetchLogin() {
    loginBloc.add(
      FetchLogin(LoginBody(email: emailKey.text, password: passwordKey.text)),
    );
  }

  void listenerLoginBloc(BuildContext context, LoginState state) {
    state.when(
      onFailed: (state) => state.failure.showSnackbar(context),
      onSuccess: (state) async {
        await FlutterSecureStorageHelper.saveToken(state.data.data?.token);

        final userDomain = state.data.data?.user;
        if (userDomain != null) {
          final userModel = model.UserLogin(
            id: userDomain.id,
            email: userDomain.email,
            avatarUrl: userDomain.avatarUrl,
            companyId: userDomain.companyId,
            createdAt: userDomain.createdAt,
            division: userDomain.division,
            fullName: userDomain.fullName,
            nip: userDomain.nip,
            role: userDomain.role,
            updatedAt: userDomain.updatedAt,
          );
          await FlutterSecureStorageHelper.saveUser(userModel);
        }

        if (context.mounted) {
          context.goNamed(ConstantRoutes.home);
        }
      },
    );
  }
}
