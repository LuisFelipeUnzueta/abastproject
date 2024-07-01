// import 'dart:js';

import 'package:abast_app/providers/auth_provider.dart';
import 'package:abast_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();
    String? message = authProvider.message;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 8,
              shadowColor: Colors.purpleAccent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildTextField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email,
                      key: const Key('textFieldSigninEmail'),
                    ),
                    const SizedBox(height: 16),
                    buildTextField(
                      controller: passwordController,
                      label: 'Senha',
                      icon: Icons.lock,
                      obscureText: true,
                      key: const Key('textFieldSigninSenha'),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        authProvider.signIn(email, password).then(
                          (response) {
                            if (response) {
                              Navigator.pushNamed(context, Routes.HOME);
                            }
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 12.0,
                        ),
                      ),
                      child: const Text("Acessar"),
                    ),
                    if (message != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          message,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.SIGNUP);
                      },
                      child: const Text(
                        "Ainda não tenho cadastro!",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    required Key key,
  }) {
    return TextField(
      key: key,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.purple),
        labelText: label,
        labelStyle: TextStyle(color: Colors.purple),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purpleAccent),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
