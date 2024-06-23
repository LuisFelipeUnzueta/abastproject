import 'package:abast_app/providers/abast_provider.dart';
import 'package:abast_pk/abast_pk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'abast_list_tile.dart';

class AbastList extends StatelessWidget {
  const AbastList({super.key});

  @override
  Widget build(BuildContext context) {
    final abastProvider = context.watch<AbastProvider>();
    // final abastecimentos = abastProvider.abastecimentos;
    // final List<Abastecimento> listaAbast = abastecimentos;
    final List<Abastecimento> listaAbast = abastProvider.abastecimentos;

    if (listaAbast.isEmpty) {
      abastProvider.list();
    }

    return ListView.builder(
      itemCount: listaAbast.length,
      itemBuilder: (context, index) {
        Abastecimento abast = listaAbast[index];
        return AbastListTile(abast);
      },
    );
  }
}
