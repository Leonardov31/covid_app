import 'package:flutter/material.dart';

import 'app/app_theme.dart';
import 'view/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const Home(),
    );
  }
}
