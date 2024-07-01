import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "21:51:40");
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.purple,
        title: const Text("Sobre nós"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info,
              size: 100,
              color: Colors.purple,
            ),
            SizedBox(height: 20),
            Text(
              "Sobre Nós!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            SizedBox(height: 20),
            Text(
              "Projeto Infnet - Flutter - INtegrações",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
