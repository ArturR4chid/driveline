import 'package:flutter/material.dart';

class MensagensTela extends StatelessWidget {
  const MensagensTela({super.key});

  final List<Map<String, String>> mensagens = const [
    {"titulo": "Mensagem do Suporte", "descricao": "Seu agendamento foi confirmado"},
    {"titulo": "Promoção", "descricao": "Ganhe 10% de desconto na próxima manutenção"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mensagens"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mensagens.length,
        itemBuilder: (context, index) {
          final item = mensagens[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.message),
              title: Text(item["titulo"]!),
              subtitle: Text(item["descricao"]!),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
