class Multa {
  final String descricao;
  final DateTime data;
  final double valor;
  final String status; // Paga, Pendente

  Multa({
    required this.descricao,
    required this.data,
    required this.valor,
    required this.status,
  });
}

class IPVA {
  final int ano;
  final double valor;
  final String status; // Pago, Pendente

  IPVA({
    required this.ano,
    required this.valor,
    required this.status,
  });
}