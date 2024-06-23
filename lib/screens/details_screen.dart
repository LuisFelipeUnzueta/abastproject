import 'package:abast_pk/abast_pk.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final abast = ModalRoute.of(context)!.settings.arguments as Abastecimento;
    final valorTotal = abast.valorTotal.toStringAsFixed(2);
    final quantidadeLitros = abast.quantidadeLitros.toStringAsFixed(2);
    final quilometragem = abast.quilometragemRodada.toString();
    final autonomia = abast.autonomia().toStringAsFixed(2);
    final valorPorLitro = abast.valorPorLitro().toStringAsFixed(3);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Detalhes"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Text("Valor Total: "),
                Text('R\$ $valorTotal'),
              ],
            ),
            Row(
              children: [
                const Text("Quant. Litros: "),
                Text('$quantidadeLitros L'),
              ],
            ),
            Row(
              children: [
                const Text("Km rodada: "),
                Text('$quilometragem km'),
              ],
            ),
            Row(
              children: [
                const Text("Autonomia: "),
                Text('$autonomia km/l'),
              ],
            ),
            Row(
              children: [
                const Text("Valor por litro: "),
                Text('$valorPorLitro \$/l'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
