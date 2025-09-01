class Emergencia {
  final DateTime data;
  final String localizacao;
  final String tipo; // Pneu furado, Pane elétrica, etc.
  final String status; // Em andamento, Resolvido

  Emergencia({
    required this.data,
    required this.localizacao,
    required this.tipo,
    required this.status,
  });
}