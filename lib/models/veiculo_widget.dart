class Veiculo {
  final int? id;
  final String marca;
  final String modelo;
  final int ano;
  final String placa;
  final double quilometragem;
  final int proprietarioId; // Id do usuário proprietário

  Veiculo({
    this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.placa,
    required this.quilometragem,
    required this.proprietarioId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'placa': placa,
      'quilometragem': quilometragem,
      'proprietarioId': proprietarioId,
    };
  }

  factory Veiculo.fromMap(Map<String, dynamic> map) {
    return Veiculo(
      id: map['id'],
      marca: map['marca'],
      modelo: map['modelo'],
      ano: map['ano'],
      placa: map['placa'],
      quilometragem: (map['quilometragem'] as num).toDouble(),
      proprietarioId: map['proprietarioId'],
    );
  }
}

