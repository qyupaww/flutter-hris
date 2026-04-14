import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/features/auth/register/data/models/body/list_company_body.dart';
import 'package:morpheme_flutter_lite/features/auth/register/domain/entities/list_company_entity.dart';
import 'package:morpheme_flutter_lite/features/auth/register/presentation/bloc/list_company/list_company_bloc.dart';

import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/core/extensions/morpheme_failure_extension.dart';
import 'package:morpheme_flutter_lite/features/auth/register/data/models/body/register_body.dart';
import 'package:morpheme_flutter_lite/features/auth/register/presentation/bloc/register/register_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:morpheme_flutter_lite/features/auth/login/data/models/response/login_response.dart'
    as model_login;

part 'register_state.dart';

class RegisterCubit extends MorphemeCubit<RegisterStateCubit> {
  RegisterCubit({required this.listCompanyBloc, required this.registerBloc})
    : super(RegisterStateCubit());

  final ListCompanyBloc listCompanyBloc;
  final RegisterBloc registerBloc;

  final fullNameKey = GlobalKey<MoleculeTextFieldState>();
  final emailKey = GlobalKey<MoleculeTextFieldState>();
  final nipKey = GlobalKey<MoleculeTextFieldState>();
  final divisionKey = GlobalKey<MoleculeTextFieldState>();
  final passwordKey = GlobalKey<MoleculeTextFieldState>();

  final companyKey = GlobalKey<MoleculeDropdownState<DataListCompany>>();

  @override
  void initState(BuildContext context) {
    super.initState(context);
    fetchListCompany();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
    BlocProvider<RegisterBloc>.value(value: registerBloc),
    BlocProvider<ListCompanyBloc>.value(value: listCompanyBloc),
  ];
  @override
  List<BlocListener> blocListeners(BuildContext context) => [
    BlocListener<RegisterBloc, RegisterState>(listener: listenerRegisterBloc),
    BlocListener<ListCompanyBloc, ListCompanyState>(
      listener: listenerListCompanyBloc,
    ),
  ];
  @override
  void dispose() {
    listCompanyBloc.close();
    registerBloc.close();
    super.dispose();
  }

  void onRegisterPressed(BuildContext context) {
    if (fullNameKey.validate() &&
        emailKey.validate() &&
        nipKey.validate() &&
        divisionKey.validate() &&
        passwordKey.validate() &&
        companyKey.validate()) {
      fetchRegister();
    }
  }

  void onLoginPressed(BuildContext context) {
    context.pop();
  }

  void fetchListCompany() {
    listCompanyBloc.add(FetchListCompany(ListCompanyBody()));
  }

  void listenerListCompanyBloc(BuildContext context, ListCompanyState state) {
    state.when(
      onFailed: (state) => state.failure.showSnackbar(context),
      onSuccess: (state) {
        final data = state.data.data ?? [];

        emit(this.state.copyWith(listCompany: data));
      },
    );
  }

  void fetchRegister() {
    registerBloc.add(
      FetchRegister(
        RegisterBody(
          fullName: fullNameKey.text,
          email: emailKey.text,
          nip: nipKey.text,
          division: divisionKey.text,
          password: passwordKey.text,
          companyId: companyKey.value?.id,
        ),
      ),
    );
  }

  void listenerRegisterBloc(BuildContext context, RegisterState state) {
    state.when(
      onFailed: (state) => state.failure.showSnackbar(context),
      onSuccess: (state) async {
        final userRegister = state.data.data?.user;
        if (userRegister != null) {
          final userLogin = model_login.UserLogin(
            id: userRegister.id,
            email: userRegister.email,
            avatarUrl: userRegister.avatarUrl,
            companyId: userRegister.companyId,
            createdAt: userRegister.createdAt,
            division: userRegister.division,
            fullName: userRegister.fullName,
            nip: userRegister.nip,
            role: userRegister.role,
            updatedAt: userRegister.updatedAt,
          );
          await FlutterSecureStorageHelper.saveUser(userLogin);
        }

        if (context.mounted) {
          context.goNamed(ConstantRoutes.home);
        }
      },
    );
  }
}
