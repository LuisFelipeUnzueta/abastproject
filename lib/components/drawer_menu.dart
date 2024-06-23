import 'package:abast_app/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.local_gas_station),
            title: const Text("Dashboard"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, Routes.DASHBOARD);
            },
          ),
          ListTile(
            leading: const Icon(Icons.car_rental),
            title: const Text("Veículos"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, Routes.VEICULOSLISTSCREEN);
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_gas_station),
            title: const Text("Abastecimentos"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              // Navigator.pushNamed(context, routeName)
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text("Formulário"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, Routes.FORM);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Sobre nós"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              // Navigator.pushNamed(context, routeName)
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sair"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, Routes.SIGNIN);
            },
          ),
        ],
      ),
    );
  }
}
