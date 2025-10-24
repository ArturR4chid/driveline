import 'package:flutter/material.dart';

class PromocoesTela extends StatelessWidget {
  const PromocoesTela({super.key});

  final List<Map<String, String>> promocoes = const [
    {
      "titulo": "20% off na troca de óleo",
      "descricao": "Válido até 10/10/2025"
    },
    {
      "titulo": "Desconto em peças",
      "descricao": "10% off em compras acima de R\$100"
    },
    {
      "titulo": "Limpeza de ar-condicionado",
      "descricao": "Válido até 15/10/2025"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promoções"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: promocoes.length,
        itemBuilder: (context, index) {
          final item = promocoes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.local_offer, color: Colors.black87),
              title: Text(item["titulo"]!),
              subtitle: Text(item["descricao"]!),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // Aqui você pode abrir detalhes da promoção
              },
            ),
          );
        },
      ),
    );
  }
}
