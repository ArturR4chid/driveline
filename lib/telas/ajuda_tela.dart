import 'package:flutter/material.dart';

class AjudaTela extends StatelessWidget {
  const AjudaTela({super.key});

  // Exemplo de itens de ajuda/FAQ
  final List<Map<String, String>> faqs = const [
    {"pergunta": "Como agendar manutenção?", "resposta": "Vá na tela de Agendamento e siga as instruções."},
    {"pergunta": "Como visualizar alertas do carro?", "resposta": "Clique no botão Notificações na tela de perfil."},
    {"pergunta": "Como entrar em contato com suporte?", "resposta": "Use a opção Suporte na lista inferior da tela de perfil."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajuda / FAQ"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final item = faqs[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: const Icon(Icons.help_outline),
              title: Text(item["pergunta"]!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(item["resposta"]!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
