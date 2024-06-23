import 'package:abast_app/components/abast_form.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Abastecimento'),
      ),
      body: AbastForm(),
    );
  }
}
