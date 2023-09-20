import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/services/firebase_service/firebase_auth.dart';
import 'package:flutter_template/usecases/app/bloc/app_bloc.dart';
import 'package:flutter_template/usecases/auth/auth_page.dart';
import 'package:flutter_template/usecases/home/home_page.dart';

class AppDirector extends StatelessWidget {
  const AppDirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: FirebaseAuthService.getUserStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const AuthPage();
            }
          },
        );
      },
    );
  }
}
