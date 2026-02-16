import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_hris/core/components/organisms/organism_attendance_card.dart';
import 'package:flutter_hris/core/constants/constant_sizes.dart';
import 'package:flutter_hris/core/themes/color_theme.dart';
import 'package:flutter_hris/extension/app_color_extension.dart';
import 'package:flutter_hris/features/home/presentations/widgets/home_header_section.dart';
import 'package:flutter_hris/features/home/presentations/widgets/home_live_time_section.dart';
import 'package:flutter_hris/features/home/presentations/widgets/home_location_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark
          ? PColor().backgroundDark
          : PColor().white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(ConstantSizes.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HomeHeaderSection(),
              SizedBox(height: 32.h),
              const HomeLiveTimeSection(),
              SizedBox(height: 32.h),
              const HomeLocationCard(),
              SizedBox(height: 24.h),
              AttendanceCard(
                onCheckOutPressed: () {
                  context.pushNamed('detail');
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
