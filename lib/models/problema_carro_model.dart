class ProblemaCarro {
  final String titulo;
  final String descricao;
  final DateTime data;
  final String? imagemPath;
  final String status; // Pendente, Em andamento, Resolvido

  ProblemaCarro({
    required this.titulo,
    required this.descricao,
    required this.data,
    this.imagemPath,
    this.status = 'Pendente',
  });
}