import 'dart:convert';

import 'package:abast_app/models/veiculo.dart';
import 'package:http/http.dart' as http;

class VeiculosService {
  static const String url = "https://dmf-n1l-default-rtdb.firebaseio.com/";
  static const String resource = "veiculos";

  // http://dominio/recurso.json -> listar / inserir
  // http://dominio/recurso/id.json -> listar / inserir

  // listar
  static Future<List<Veiculo>> getList() async {
    List<Veiculo> veiculos = List.empty(growable: true); // <Veiculo>[]
    Uri uri = Uri.parse("$url$resource.json");
    http.Response res = await http.get(uri);
    String resultStr = res.body; // "null"
    Map<String, dynamic> result = jsonDecode(resultStr);
    result.forEach((id, valores) {
      veiculos.add(Veiculo.fromJson(id, valores));
    });
    return veiculos;
  }

  // Inserir
  static Future<Veiculo> insert(Veiculo veiculo) async {
    String data = jsonEncode(veiculo.toJson());
    Uri uri = Uri.parse("$url$resource.json");
    http.Response res = await http.post(uri, body: data);
    String id = res.body;
    veiculo.id = id;
    return veiculo;
  }

  // Ler
  static Future<Veiculo> show(String id) async {
    Uri uri = Uri.parse("$url$resource/$id.json");
    http.Response res = await http.get(uri);
    String resultStr = res.body; // "null"
    Map<String, dynamic> result = jsonDecode(resultStr);
    return Veiculo.fromJson(id, result);
  }

  // Atualizar
  static Future<Veiculo> update(String id, Veiculo veiculo) async {
    String data = jsonEncode(veiculo.toJson());
    Uri uri = Uri.parse("$url$resource/$id.json");
    http.Response res = await http.put(uri, body: data);
    String body = res.body;
    // http.Response res = await http.patch(uri, body: data);
    // if (res.statusCode == 200)
    veiculo.id = id;
    return veiculo;
  }

  // Deletar
  static Future<bool> delete(String id) async {
    Uri uri = Uri.parse("$url$resource/$id.json");
    http.Response res = await http.delete(uri);
    if (res.statusCode == 200) return true;
    // String body = res.body;
    return false;
  }
}
