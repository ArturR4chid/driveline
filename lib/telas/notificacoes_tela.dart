import 'package:flutter/material.dart';

class NotificacoesTela extends StatelessWidget {
  const NotificacoesTela({super.key});

  // Exemplo de notificações do carro
  final List<Map<String, String>> notificacoes = const [
    {"titulo": "Alerta de manutenção", "descricao": "Troca de óleo programada para 10/10/2025"},
    {"titulo": "Guincho disponível", "descricao": "Serviço de guincho ativo para emergências"},
    {"titulo": "Multa recebida", "descricao": "Multa registrada em 01/09/2025"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notificações do Carro"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notificacoes.length,
        itemBuilder: (context, index) {
          final item = notificacoes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(item["titulo"]!),
              subtitle: Text(item["descricao"]!),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Futuramente pode abrir detalhes da notificação
              },
            ),
          );
        },
      ),
    );
  }
}
