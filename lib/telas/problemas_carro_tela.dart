import 'package:flutter/material.dart';
import '../models/problema_carro_model.dart';

class ProblemasCarroTela extends StatefulWidget {
  @override
  _ProblemasCarroTelaState createState() => _ProblemasCarroTelaState();
}

class _ProblemasCarroTelaState extends State<ProblemasCarroTela> {
  final List<ProblemaCarro> _problemas = [];
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Problemas do Carro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: "Título do Problema"),
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: "Descrição"),
              maxLines: 3,
            ),
            ElevatedButton(
              onPressed: _adicionarProblema,
              child: Text("Reportar Problema"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _problemas.length,
                itemBuilder: (context, index) {
                  final problema = _problemas[index];
                  return ListTile(
                    title: Text(problema.titulo),
                    subtitle: Text(problema.descricao),
                    trailing: Chip(
                      label: Text(problema.status),
                      backgroundColor: problema.status == "Resolvido" 
                          ? Colors.green 
                          : Colors.orange,
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

  void _adicionarProblema() {
    if (_tituloController.text.isEmpty || _descricaoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha todos os campos")),
      );
      return;
    }

    setState(() {
      _problemas.add(ProblemaCarro(
        titulo: _tituloController.text,
        descricao: _descricaoController.text,
        data: DateTime.now(),
      ));
      _tituloController.clear();
      _descricaoController.clear();
    });
  }
}