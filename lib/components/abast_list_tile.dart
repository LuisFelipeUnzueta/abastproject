import 'package:abast_pk/abast_pk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/abast_provider.dart';

class AbastListTile extends StatelessWidget {
  const AbastListTile(
    this.abast, {
    super.key,
  });

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
        icon: const Icon(Icons.delete),
        onPressed: () {
          abastProvider.delete(abast);
        },
      ),
      title: Text('R\$ $valorTotal'),
      subtitle: Text('$quantLitros L'),
      trailing: Column(
        children: [
          Text('${abast.id}'),
          Text('$autonomia km/l'),
          Text('R\$ $valorPorLitro'),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          'details_screen',
          arguments: abast,
        );
        // Navigator.push(context,
        //   MaterialPageRoute(builder: (context) {
        //     return DetailsScreen();
        //   })
        // );
      },
    );
  }
}
