import 'package:covid_app/src/utils/auth_form_validations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: const Text("Cadastrar"),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) {
                        return AuthFormValidations.formValidator(value);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Senha"),
                      validator: (value) {
                        return AuthFormValidations.formValidator(value);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () => trySignout(context),
                      child: const Text("Cadastrar"),
                    ),
                    const SizedBox(height: 10.0),
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Entrar"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void trySignout(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthService>().signUp(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }
}
