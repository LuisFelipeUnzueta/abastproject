import 'package:abast_pk/abast_pk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/abast_provider.dart';

class AbastListTile extends StatelessWidget {
  const AbastListTile(this.abast, {super.key});

  final Abastecimento abast;

  @override
  Widget build(BuildContext context) {
    final abastProvider = context.watch<AbastProvider>();

    String valorTotal = abast.valorTotal.toStringAsFixed(2);
    String quantLitros = abast.quantidadeLitros.toStringAsFixed(2);
    String autonomia = abast.autonomia().toStringAsFixed(2);
    String valorPorLitro = abast.valorPorLitro().toStringAsFixed(2);

    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.delete, color: Colors.purple),
        onPressed: () => abastProvider.delete(abast),
      ),
      title: Text(
        'R\$ $valorTotal',
        style: const TextStyle(color: Colors.purple),
      ),
      subtitle: Text(
        '$quantLitros L',
        style: const TextStyle(color: Colors.purpleAccent),
      ),
      trailing: buildTrailingInfo(),
      onTap: () => Navigator.pushNamed(
        context,
        'details_screen',
        arguments: abast,
      ),
    );
  }

  Widget buildTrailingInfo() {
    String autonomia = abast.autonomia().toStringAsFixed(2);
    String valorPorLitro = abast.valorPorLitro().toStringAsFixed(2);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${abast.id}',
          style: const TextStyle(color: Colors.purple),
        ),
        Text(
          '$autonomia km/l',
          style: const TextStyle(color: Colors.purple),
        ),
        Text(
          'R\$ $valorPorLitro',
          style: const TextStyle(color: Colors.purple),
        ),
      ],
    );
  }
}
