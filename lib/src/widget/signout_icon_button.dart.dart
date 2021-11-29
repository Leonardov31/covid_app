import 'package:covid_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignoutIconButton extends StatelessWidget {
  const SignoutIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<AuthService>().signOut();
        Navigator.pop(context);
      },
      icon: const Icon(Icons.logout),
    );
  }
}
