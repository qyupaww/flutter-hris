import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentations/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginCubit {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () => onLoginPressed(context),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => onRegisterPressed(context),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
