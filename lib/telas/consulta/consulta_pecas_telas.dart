import 'package:flutter/material.dart';
import '../../models/pecas_widget.dart';   
import 'detalhes_peca_tela.dart'; 


class ConsultaPecasTela extends StatefulWidget {
  const ConsultaPecasTela({super.key});

  @override
  _ConsultaPecasTelaState createState() => _ConsultaPecasTelaState();
}

class _ConsultaPecasTelaState extends State<ConsultaPecasTela> {
  final List<PecaCarro> _pecas = [
    PecaCarro(
      nome: 'Dpaschoal',
      tipo: 'Roda',
      avaliacao: 4.2,
      preco: 750,
      status: 'Aberto',
      fecha: '23:30',
      imagem: 'assets/roda.png',
    ),
    PecaCarro(
      nome: 'Pneus Barato',
      tipo: 'Pneu',
      avaliacao: 3.0,
      preco: 699,
      status: 'Aberto',
      fecha: '21:30',
      imagem: 'assets/roda.png',
    ),
    PecaCarro(
      nome: 'PneuStore',
      tipo: 'Pneu',
      avaliacao: 5.0,
      preco: 790,
      status: 'Aberto',
      fecha: '20:30',
      imagem: 'assets/roda.png',
    ),
    PecaCarro(
      nome: 'Rodabrill Pneus',
      tipo: 'Pneu',
      avaliacao: 5.0,
      preco: 590,
      status: 'Aberto',
      fecha: '00:00',
      imagem: 'assets/roda.png',
    ),
    PecaCarro(
      nome: 'Pneus Online',
      tipo: 'Pneu',
      avaliacao: 5.0,
      preco: 490,
      status: 'Fechado',
      fecha: '09:00',
      imagem: 'assets/roda.png',
    ),
  ];

  String _filtro = '';

  @override
  Widget build(BuildContext context) {
    final List<PecaCarro> pecasFiltradas = _pecas
        .where((peca) =>
            peca.nome.toLowerCase().contains(_filtro.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Pesquisar peça',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (valor) {
            setState(() {
              _filtro = valor;
            });
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          if (_filtro.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _filtro = '';
                });
              },
            ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: pecasFiltradas.length,
        itemBuilder: (context, index) {
          final peca = pecasFiltradas[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Image.asset(
                peca.imagem,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                peca.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text('${peca.avaliacao}'),
                      const SizedBox(width: 10),
                      Text('R\$ ${peca.preco}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${peca.status} - Fecha às ${peca.fecha}',
                    style: TextStyle(
                      color: peca.status == 'Aberto'
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesPecaTela(peca: peca),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


