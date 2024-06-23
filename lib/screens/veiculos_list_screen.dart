import 'package:abast_app/components/drawer_menu.dart';
import 'package:abast_app/models/veiculo.dart';
import 'package:abast_app/services/veiculos_service.dart';
import 'package:flutter/material.dart';

class VeiculosListScreen extends StatelessWidget {
  const VeiculosListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VeiculosService.delete("-O-cUUp46zaXLE09Iccq");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Veículos"),
      ),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
        future: VeiculosService.getList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // return Text(snapshot.data!.length.toString());
              List<Veiculo> veiculos = snapshot.data!;
              return ListView.builder(
                itemCount: veiculos.length,
                itemBuilder: (context, index) {
                  Veiculo veiculo = veiculos[index];
                  return ListTile(
                    title: Text(veiculo.placa),
                    subtitle: Text(veiculo.id!),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Erro: ${snapshot.error.toString()}");
            } else {
              return const Text("Nenhum veículo cadastrado!");
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
