import 'package:abast_pk/abast_pk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/abast_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final abastProvider = context.watch<AbastProvider>();
    final List<Abastecimento>? listaAbast = abastProvider.abastecimentos;

    final autonomiaMedia =
        listaAbast![0].autonomiaMedia(listaAbast).toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("$autonomiaMedia km/l"),
          ],
        ),
      ),
    );
  }
}
