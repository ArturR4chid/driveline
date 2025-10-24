import 'package:flutter/material.dart';

class SuporteTela extends StatelessWidget {
  const SuporteTela({super.key});

  final List<Map<String, String>> contatos = const [
    {
      "titulo": "Atendimento via chat",
      "descricao": "Respostas rápidas diretamente no app"
    },
    {
      "titulo": "E-mail",
      "descricao": "suporte@seucarroapp.com"
    },
    {
      "titulo": "Telefone",
      "descricao": "(11) 99999-9999"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suporte"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          final item = contatos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.support_agent, color: Colors.black87),
              title: Text(item["titulo"]!),
              subtitle: Text(item["descricao"]!),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // Aqui você pode abrir detalhes do contato ou iniciar ação
              },
            ),
          );
        },
      ),
    );
  }
}
