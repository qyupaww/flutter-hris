import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/features/home/home/presentation/widgets/widgets.dart';

import '../cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with MorphemeStatePage<HomePage, HomeCubit> {
  @override
  HomeCubit setCubit() => locator<HomeCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(ConstantSizes.defaultPadding),
          child: Column(
            spacing: ConstantSizes.s32,
            children: [
              HeaderSection(),
              LiveTimeSection(),
              CurrentLocationSection(),
              AttendanceSection(),
            ],
          ),
        ),
      ),
    );
  }
}
