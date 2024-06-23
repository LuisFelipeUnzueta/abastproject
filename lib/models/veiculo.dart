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

  /* static Veiculo fromJson(Map<String, dynamic> json) {
    Veiculo veiculo = Veiculo(
      json['placa'],
      json['marca'],
      json['modelo'],
      json['ano'],
    );
    veiculo.id = json['id'];
    return veiculo;
  } */
}


// -O-cUeButT9i_7u7Arit: {
//    ano: 2024, 
//    marca: marca, 
//    modelo: modelo, 
//    placa: xpt1o23
// }