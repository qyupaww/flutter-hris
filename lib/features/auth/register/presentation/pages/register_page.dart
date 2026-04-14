import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_extension/morpheme_extension.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/auth/component/header_section.dart';
import 'package:morpheme_flutter_lite/features/auth/register/domain/entities/list_company_entity.dart';
import 'package:morpheme_flutter_lite/features/auth/register/presentation/bloc/list_company/list_company_bloc.dart';
import 'package:morpheme_flutter_lite/features/auth/register/presentation/bloc/register/register_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../cubit/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with MorphemeStatePage<RegisterPage, RegisterCubit> {
  @override
  RegisterCubit setCubit() => locator<RegisterCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    final fullNameKey = context.select(
      (RegisterCubit bloc) => bloc.fullNameKey,
    );
    final emailKey = context.select((RegisterCubit bloc) => bloc.emailKey);
    final nipKey = context.select((RegisterCubit bloc) => bloc.nipKey);
    final divisionKey = context.select(
      (RegisterCubit bloc) => bloc.divisionKey,
    );
    final passwordKey = context.select(
      (RegisterCubit bloc) => bloc.passwordKey,
    );
    final companyKey = context.select((RegisterCubit bloc) => bloc.companyKey);

    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(ConstantSizes.defaultPadding),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              HeaderSection(
                title: 'Create Account',
                subtitle: 'Please fill in the details below to register',
              ),
              AtomSpacing.vertical24(),
              MoleculeTextField(
                key: fullNameKey,
                title: 'Full Name',
                textInputAction: .next,
                decoration: InputDecoration(hintText: 'Enter your full name'),
                validator: (context, value) {
                  if (value.isEmpty) {
                    return ValidatorValue.error('Full name is required');
                  }
                  return null;
                },
              ),
              AtomSpacing.vertical16(),
              MoleculeTextField(
                key: emailKey,
                title: 'Email Addressed',
                keyboardType: .emailAddress,
                textInputAction: .next,
                decoration: InputDecoration(hintText: 'Enter your email'),
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
              Builder(
                builder: (context) {
                  final listCompanyState = context
                      .watch<ListCompanyBloc>()
                      .state;

                  final listCompany = context.select(
                    (RegisterCubit bloc) => bloc.state.listCompany,
                  );

                  return Skeletonizer(
                    enabled: listCompanyState.isLoading,
                    child: MoleculeDropdown<DataListCompany>(
                      key: companyKey,
                      title: 'Company',
                      decoration: InputDecoration(
                        hintText: 'Select your company',
                      ),
                      validator: (context, value) {
                        if (value == null) {
                          return ValidatorValue.error('Company is required');
                        }
                        return null;
                      },
                      items: listCompany
                          .map(
                            (company) => DropdownMenuItem(
                              value: company,
                              child: Text(company.name ?? ''),
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
              AtomSpacing.vertical16(),
              MoleculeTextField(
                key: nipKey,
                title: 'NIP',
                keyboardType: .number,
                textInputAction: .next,
                decoration: InputDecoration(hintText: 'Enter your NIP'),
                validator: (context, value) {
                  if (value.isEmpty) {
                    return ValidatorValue.error('NIP is required');
                  }
                  return null;
                },
              ),
              AtomSpacing.vertical16(),
              MoleculeTextField(
                key: divisionKey,
                title: 'Division',
                textInputAction: .next,
                decoration: InputDecoration(hintText: 'Enter your Division'),
                validator: (context, value) {
                  if (value.isEmpty) {
                    return ValidatorValue.error('Division is required');
                  }
                  return null;
                },
              ),
              AtomSpacing.vertical16(),
              MoleculeTextField(
                key: passwordKey,
                title: 'Password',
                textInputAction: .done,
                decoration: InputDecoration(hintText: 'Enter your password'),
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
                  final registerState = context.watch<RegisterBloc>().state;

                  return AtomButton.elevated(
                    isLoading: registerState.isLoading,
                    text: 'Register',
                    onPressed: () => context
                        .read<RegisterCubit>()
                        .onRegisterPressed(context),
                  );
                },
              ),
              AtomSpacing.vertical16(),
              AtomButton.text(
                textRich: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: context.color.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: context.color.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                onPressed: () =>
                    context.read<RegisterCubit>().onLoginPressed(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
