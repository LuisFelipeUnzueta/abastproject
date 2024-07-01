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
        backgroundColor: Colors.purple,
      ),
      drawer: const DrawerMenu(), // Substitua pelo seu DrawerMenu, se houver
      body: FutureBuilder(
        future: VeiculosService.getList(),
        builder: (context, AsyncSnapshot<List<Veiculo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Veiculo> veiculos = snapshot.data!;
              return ListView.builder(
                itemCount: veiculos.length,
                itemBuilder: (context, index) {
                  Veiculo veiculo = veiculos[index];
                  return Card(
                    elevation: 4,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        veiculo.placa,
                        style: const TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        veiculo.id!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        // Implemente a navegação para detalhes do veículo, se necessário
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Erro: ${snapshot.error.toString()}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(
                child: Text("Nenhum veículo cadastrado!",
                    style: TextStyle(color: Colors.grey)),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
