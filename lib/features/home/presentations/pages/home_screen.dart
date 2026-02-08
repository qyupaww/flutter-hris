import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/theme.dart';
import 'package:mobile/utils/theme.manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            onPressed: () => ThemeManager().toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.png'),
            Text(
              'Nafanesia Academy',
              style: MyTheme.style.semiBold.copyWith(fontSize: 20.sp),
              textAlign: TextAlign.center,
            ),
            Text(
              'Engineering Exellence',
              style: MyTheme.style.medium.copyWith(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),

            ElevatedButton(
              onPressed: () {
                context.pushNamed('detail');
              },
              child: const Text('Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
