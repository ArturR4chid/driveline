import 'package:flutter/material.dart';

class AtividadeTela extends StatelessWidget {
  const AtividadeTela({super.key});

  // Exemplo de atividades do usuário
  final List<Map<String, String>> atividades = const [
    {"titulo": "Agendamento de manutenção", "data": "01/09/2025"},
    {"titulo": "Consulta de peças", "data": "28/08/2025"},
    {"titulo": "Notificação de alerta", "data": "15/08/2025"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atividade do Usuário"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: atividades.length,
        itemBuilder: (context, index) {
          final item = atividades[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.list_alt),
              title: Text(item["titulo"]!),
              subtitle: Text(item["data"]!),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Futuramente pode abrir detalhes da atividade
              },
            ),
          );
        },
      ),
    );
  }
}
