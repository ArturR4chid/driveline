import 'package:flutter/material.dart';
import '../../models/pecas_widget.dart';

class DetalhesPecaTela extends StatelessWidget {
  final PecaCarro peca;

  const DetalhesPecaTela({super.key, required this.peca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(peca.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                peca.imagem,
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 20),
            Text("Nome: ${peca.nome}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Tipo: ${peca.tipo}", style: const TextStyle(fontSize: 16)),
            Text("Avaliação: ${peca.avaliacao} ⭐",
                style: const TextStyle(fontSize: 16)),
            Text("Preço: R\$ ${peca.preco.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16)),
            Text("Status: ${peca.status}",
                style: TextStyle(
                  fontSize: 16,
                  color: peca.status == "Aberto" ? Colors.green : Colors.red,
                )),
            Text("Fecha às: ${peca.fecha}",
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
