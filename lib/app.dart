import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/core/l10n/s.dart';
import 'package:morpheme_flutter_lite/core/global_cubit/global_cubit.dart';

// import 'firebase_options.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: Builder(
        builder: (context) {
          final theme = context.select((GlobalCubit bloc) => bloc.state.theme);
          final locale = context.select(
            (GlobalCubit bloc) => bloc.state.locale,
          );

          return MaterialApp.router(
            title: 'MorphemeLite',
            scaffoldMessengerKey: scaffoldMessengerKey,
            theme: theme.themeData,
            darkTheme: theme.themeData,
            locale: locale,
            localizationsDelegates: S.localizationsDelegates,
            supportedLocales: S.supportedLocales,
            routerConfig: locator<GoRouter>(),
          );
        },
      ),
    );
  }
}
