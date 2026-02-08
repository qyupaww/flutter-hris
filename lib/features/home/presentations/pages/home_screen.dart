import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image.asset('assets/images/splash.png'),
            Text('Nafanesia Academy'),
            Text('Engineering Exellence'),

            ElevatedButton(
              onPressed: () {
                context.pushNamed('detail');
              },
              child: Text('Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
