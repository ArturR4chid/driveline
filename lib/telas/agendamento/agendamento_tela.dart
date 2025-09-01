import 'package:flutter/material.dart';
import 'package:drivelinepit/models/agendamento_model.dart';

class AgendamentoTela extends StatefulWidget {
  const AgendamentoTela({super.key});

  @override
  State<AgendamentoTela> createState() => _AgendamentoTelaState();
}

class _AgendamentoTelaState extends State<AgendamentoTela> {
  DateTime? dataSelecionada;
  TimeOfDay? horaSelecionada;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  final List<Agendamento> _agendamentos = []; // lista local de agendamentos

  Future<void> _selecionarData() async {
    final DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      // Removido locale aqui; agora definido globalmente no MaterialApp
    );
    if (data != null) {
      setState(() {
        dataSelecionada = data;
      });
    }
  }

  Future<void> _selecionarHora() async {
    final TimeOfDay? hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (hora != null) {
      setState(() {
        horaSelecionada = hora;
      });
    }
  }

  void _confirmarAgendamento() {
    if (_nomeController.text.isEmpty ||
        _telefoneController.text.isEmpty ||
        dataSelecionada == null ||
        horaSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos!")),
      );
      return;
    }

    final novoAgendamento = Agendamento(
      nome: _nomeController.text,
      telefone: _telefoneController.text,
      data: dataSelecionada!,
      hora: horaSelecionada!,
    );

    setState(() {
      _agendamentos.add(novoAgendamento);
      _nomeController.clear();
      _telefoneController.clear();
      dataSelecionada = null;
      horaSelecionada = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Agendamento salvo com sucesso!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendamento"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Preencha os dados para agendar seu atendimento:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Nome
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Telefone
            TextField(
              controller: _telefoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Telefone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Data
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(
                dataSelecionada == null
                    ? "Selecione a data"
                    : "${dataSelecionada!.day}/${dataSelecionada!.month}/${dataSelecionada!.year}",
              ),
              trailing: const Icon(Icons.edit),
              onTap: _selecionarData,
            ),
            const Divider(),

            // Hora
            ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(
                horaSelecionada == null
                    ? "Selecione o horário"
                    : horaSelecionada!.format(context),
              ),
              trailing: const Icon(Icons.edit),
              onTap: _selecionarHora,
            ),
            const Divider(),
            const SizedBox(height: 20),

            // Botão confirmar
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _confirmarAgendamento,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Confirmar Agendamento",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              "Meus Agendamentos:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Lista de agendamentos
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _agendamentos.length,
              itemBuilder: (context, index) {
                final ag = _agendamentos[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.event_available, color: Colors.black),
                    title: Text("${ag.nome} - ${ag.telefone}"),
                    subtitle: Text(
                      "${ag.data.day}/${ag.data.month}/${ag.data.year} às ${ag.hora.format(context)}",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
