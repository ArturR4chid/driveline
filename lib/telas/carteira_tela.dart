import 'package:flutter/material.dart';

class CarteiraTela extends StatelessWidget {
  const CarteiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemplo de informações da carteira
    final double saldo = 120.50;
    final List<String> transacoes = [
      "Pagamento de manutenção - 01/09/2025",
      "Recarga de créditos - 28/08/2025",
      "Compra de peças - 15/08/2025",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carteira"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saldo
            Card(
              color: Colors.orange.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Saldo disponível: R\$ $saldo",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Últimas transações",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: transacoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(Icons.monetization_on),
                      title: Text(transacoes[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
