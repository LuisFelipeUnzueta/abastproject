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
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return null;
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) return null;
    }

    return location.getLocation();
  }

  void saveAbastecimento(BuildContext context, AbastProvider abastProvider) {
    double valorTotal = double.parse(valorTotalController.text);
    double quantLitros = double.parse(quantidadeController.text);
    int quilometragem = int.parse(quilometragemController.text);

    final abast = Abastecimento(valorTotal, quantLitros, quilometragem);
    abastProvider.insert(abast);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final abastProvider = context.watch<AbastProvider>();

    return SizedBox(
      child: Column(
        children: [
          buildTextField(
            controller: valorTotalController,
            hintText: 'Valor total (R\$)',
          ),
          buildTextField(
            controller: quantidadeController,
            hintText: 'Quantidade de litros (l)',
          ),
          buildTextField(
            controller: quilometragemController,
            hintText: 'Quilometragem (km)',
          ),
          ElevatedButton(
            onPressed: () => saveAbastecimento(context, abastProvider),
            child: const Text("Salvar"),
          ),
          FutureBuilder<LocationData?>(
            future: getLocation(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Erro ao obter localização');
              } else if (snapshot.hasData) {
                return Text(
                  'Latitude: ${snapshot.data?.latitude}, Longitude: ${snapshot.data?.longitude}',
                );
              } else {
                return const Text('Localização não disponível');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
