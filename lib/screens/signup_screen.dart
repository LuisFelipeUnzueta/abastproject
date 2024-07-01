import 'dart:io';

import 'package:abast_app/providers/auth_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routes.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? imagePath;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();
    String? message = authProvider.message;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imagePath != null
                    ? Stack(
                        children: [
                          Image.file(
                            File(imagePath!),
                            width: 200,
                            height: 200,
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  imagePath = null;
                                });
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : IconButton(
                        onPressed: () async {
                          Object? result = await Navigator.of(context)
                              .pushNamed(Routes.SIGNUPPICTURE);
                          if (result != null) {
                            setState(() {
                              imagePath = result as String;
                            });
                          }
                        },
                        icon: const Icon(Icons.camera_alt),
                        color: Colors.purple,
                      ),
                const SizedBox(height: 24),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email, color: Colors.purple),
                    hintText: 'Informe o email para cadastro.',
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Informe um email válido!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.purple),
                    hintText: 'Informe uma senha para cadastro.',
                    labelText: 'Senha',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Informe uma senha válida (mínimo 6 caracteres)!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authProvider.signUp(email!, password!).then((success) {
                        if (success) {
                          try {
                            var storage = FirebaseStorage.instance;
                            var reference = storage.ref();
                            var fileReference = reference.child('$email.jpg');
                            var imageFile = File(imagePath!);
                            fileReference.putFile(imageFile);
                          } on FirebaseException catch (e) {
                            print('Erro FirebaseStorage: ${e.message}');
                          }
                          Navigator.pushReplacementNamed(context, Routes.HOME);
                        } else {
                          // Handle error message
                        }
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text("Cadastrar"),
                ),
                if (message != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
