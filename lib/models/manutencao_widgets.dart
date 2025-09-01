enum StatusManutencao { Pendente, EmAndamento, Concluida }

class Manutencao {
  String tipo;
  DateTime data;
  double valor;
  StatusManutencao status;

  Manutencao({
    required this.tipo,
    required this.data,
    required this.valor,
    required this.status,
  });
}
