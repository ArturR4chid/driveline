import 'package:flutter/material.dart';

class HistoricoTela extends StatelessWidget {
  const HistoricoTela({super.key});

  // Exemplo de histórico de serviços do carro
  final List<Map<String, String>> historico = const [
    {"servico": "Troca de óleo", "data": "01/09/2025", "local": "Oficina Mecânica A"},
    {"servico": "Alinhamento", "data": "15/08/2025", "local": "Oficina Mecânica B"},
    {"servico": "Reparo freios", "data": "10/08/2025", "local": "Oficina Mecânica C"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico do Carro"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: historico.length,
        itemBuilder: (context, index) {
          final item = historico[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.car_repair),
              title: Text(item["servico"]!),
              subtitle: Text("${item["data"]} • ${item["local"]}"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Aqui futuramente pode abrir detalhes do serviço
              },
            ),
          );
        },
      ),
    );
  }
}
