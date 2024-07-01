class Veiculo {
  String? id;
  String placa;
  String marca;
  String modelo;
  int ano;

  Veiculo(this.placa, this.marca, this.modelo, this.ano);

  Veiculo.fromJson(String this.id, Map<String, dynamic> json)
      : placa = json['placa'],
        marca = json['marca'],
        modelo = json['modelo'],
        ano = json['ano'];

  Map<String, dynamic> toJson() => {
        'placa': placa,
        'marca': marca,
        'modelo': modelo,
        'ano': ano,
      };
}
