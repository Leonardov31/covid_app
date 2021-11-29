import 'package:covid_app/src/services/auth_service.dart';
import 'package:covid_app/src/view/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app_theme.dart';
import 'view/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authState,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Covid App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const Authenticate(),
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomePage();
    }
    return LoginPage();
  }
}
