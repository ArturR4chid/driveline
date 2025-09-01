import 'package:flutter/material.dart';
import '../models/emergencia_model.dart';

class EmergenciaTela extends StatefulWidget {
  @override
  _EmergenciaTelaState createState() => _EmergenciaTelaState();
}

class _EmergenciaTelaState extends State<EmergenciaTela> {
  String _tipoEmergencia = "Pneu furado";
  final List<Emergencia> _historicoEmergencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sistema de Emergência")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _tipoEmergencia,
              items: [
                "Pneu furado",
                "Pane elétrica",
                "Problema no motor",
                "Acidente",
                "Outro"
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _tipoEmergencia = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _solicitarEmergencia,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                "Solicitar Socorro",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text("Histórico de Emergências"),
            Expanded(
              child: ListView.builder(
                itemCount: _historicoEmergencias.length,
                itemBuilder: (context, index) {
                  final emergencia = _historicoEmergencias[index];
                  return ListTile(
                    title: Text(emergencia.tipo),
                    subtitle: Text("${emergencia.data.day}/${emergencia.data.month}/${emergencia.data.year}"),
                    trailing: Chip(
                      label: Text(emergencia.status),
                      backgroundColor: emergencia.status == "Resolvido" 
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

  void _solicitarEmergencia() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Socorro Solicitado"),
          content: Text("Sua solicitação de emergência para '$_tipoEmergencia' foi enviada. Em breve entraremos em contato."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _historicoEmergencias.add(Emergencia(
                    data: DateTime.now(),
                    localizacao: "São Paulo, SP", // Em app real, pegar do GPS
                    tipo: _tipoEmergencia,
                    status: "Em andamento",
                  ));
                });
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}