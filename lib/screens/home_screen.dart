import 'package:flutter/material.dart';
import '../components/abast_list.dart';
import '../components/drawer_menu.dart';
import '../routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'about_screen').then((value) {
                String valor = value as String;
                print("Voltando para a Home Screen $valor");
              });
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: const AbastList(),
      drawer: DrawerMenu(),
    );
  }
}


