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
        backgroundColor: Colors.purple,
        title: const Text("Detalhes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 8,
          shadowColor: Colors.purpleAccent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailRow('Valor Total:', 'R\$ $valorTotal'),
                buildDetailRow('Quant. Litros:', '$quantidadeLitros L'),
                buildDetailRow('Km rodada:', '$quilometragem km'),
                buildDetailRow('Autonomia:', '$autonomia km/l'),
                buildDetailRow('Valor por litro:', 'R\$ $valorPorLitro \$/l'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.purpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}
