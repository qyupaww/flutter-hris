import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_extension/morpheme_extension.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/auth/component/header_section.dart';
import 'package:morpheme_flutter_lite/features/auth/login/presentation/bloc/login/login_bloc.dart';

import '../cubit/login_cubit.dart';
import 'package:morpheme_flutter_lite/core/l10n/s.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with MorphemeStatePage<LoginPage, LoginCubit> {
  @override
  LoginCubit setCubit() => locator<LoginCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    final emailKey = context.select((LoginCubit bloc) => bloc.emailKey);
    final passwordKey = context.select((LoginCubit bloc) => bloc.passwordKey);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(ConstantSizes.defaultPadding),
            child: Container(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
                  HeaderSection(
                    title: S.of(context)?.loginTitle ?? '',
                    subtitle: S.of(context)?.loginSubtitle ?? '',
                  ),
                  AtomSpacing.vertical40(),
                  MoleculeTextField(
                    key: emailKey,
                    title: S.of(context)?.emailLabel ?? '',
                    keyboardType: .emailAddress,
                    textInputAction: .next,
                    decoration: InputDecoration(hintText: 'user@email.com'),
                    validator: (context, value) {
                      if (value.isEmpty) {
                        return ValidatorValue.error('Email is required');
                      } else if (!value.isEmail) {
                        return ValidatorValue.error('Email is invalid');
                      }
                      return null;
                    },
                  ),
                  AtomSpacing.vertical16(),
                  MoleculeTextField(
                    key: passwordKey,
                    isPassword: true,
                    title: S.of(context)?.passwordLabel ?? '',
                    textInputAction: .done,
                    decoration: InputDecoration(hintText: '••••••••••••'),
                    validator: (context, value) {
                      if (value.isEmpty) {
                        return ValidatorValue.error('Password is required');
                      } else if (value.length < 6) {
                        return ValidatorValue.error(
                          'Password must be at least 6 characters',
                        );
                      }
                      return null;
                    },
                  ),
                  AtomSpacing.vertical16(),
                  Builder(
                    builder: (context) {
                      final loginState = context.watch<LoginBloc>().state;

                      return AtomButton.elevated(
                        isLoading: loginState.isLoading,
                        text: S.of(context)?.loginButton ?? '',
                        onPressed: () =>
                            context.read<LoginCubit>().onLoginPressed(context),
                      );
                    },
                  ),

                  AtomSpacing.vertical16(),
                  AtomButton.text(
                    onPressed: () =>
                        context.read<LoginCubit>().onRegisterPressed(context),
                    textRich: [
                      TextSpan(
                        text: '${S.of(context)?.registerPrompt ?? ''} ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: context.color.white,
                        ),
                      ),
                      TextSpan(
                        text: S.of(context)?.registerLink ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.color.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
