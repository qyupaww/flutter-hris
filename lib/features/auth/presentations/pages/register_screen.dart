import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentations/cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with RegisterCubit {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () => onRegisterPressed(context),
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () => onLoginPressed(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
