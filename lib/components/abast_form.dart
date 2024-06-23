import 'package:abast_app/providers/abast_provider.dart';
import 'package:abast_pk/abast_pk.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class AbastForm extends StatelessWidget {
  AbastForm({super.key});

  final valorTotalController = TextEditingController();
  final quantidadeController = TextEditingController();
  final quilometragemController = TextEditingController();

  Future<LocationData?> getLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return null;
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) return null;
    }

    return location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final abastProvider = context.watch<AbastProvider>();
    final insert = abastProvider.insert;

    return SizedBox(
      child: Column(
        children: [
          TextField(
            controller: valorTotalController,
            decoration: const InputDecoration(
              hintText: 'Valor total (R\$)',
            ),
          ),
          TextField(
            controller: quantidadeController,
            decoration: const InputDecoration(
              hintText: 'Quantidade de litros (l)',
            ),
          ),
          TextField(
            controller: quilometragemController,
            decoration: const InputDecoration(
              hintText: 'Quilometragem (km)',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              double valorTotal = double.parse(valorTotalController.text);
              double quantLitros = double.parse(quantidadeController.text);
              int quilometragem = int.parse(quilometragemController.text);
              final abast =
                  Abastecimento(valorTotal, quantLitros, quilometragem);
              // addAbast(abast);
              insert(abast);
              Navigator.of(context).pop();
            },
            child: const Text("Salvar"),
          ),
          FutureBuilder(
            future: getLocation(),
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data?.latitude} ${snapshot.data?.longitude}',
              );
            },
          )
        ],
      ),
    );
  }
}
