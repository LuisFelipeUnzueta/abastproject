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
    final List<Abastecimento> listaAbast = abastProvider.abastecimentos;

    if (listaAbast.isEmpty) {
      abastProvider.list();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abastecimentos'),
        backgroundColor: Colors.purple,
      ),
      body: listaAbast.isEmpty
          ? Center(
              child: Text(
                'Nenhum abastecimento encontrado',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: listaAbast.length,
              itemBuilder: (context, index) {
                Abastecimento abast = listaAbast[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: AbastListTile(abast),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_abast_screen');
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
