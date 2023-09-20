import 'package:flutter/material.dart';
import 'package:flutter_template/services/firebase_service/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: const ElevatedButton(
        onPressed: FirebaseAuthService.signInGoogle,
        child: Center(
          child: Text('Login'),
        ),
      ),
    );
  }
}
