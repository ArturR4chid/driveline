import 'package:flutter/material.dart';
import '../models/multa_ipva_model.dart';

class MultasIPVATela extends StatefulWidget {
  @override
  _MultasIPVATelaState createState() => _MultasIPVATelaState();
}

class _MultasIPVATelaState extends State<MultasIPVATela> {
  final List<Multa> _multas = [];
  final List<IPVA> _ipvas = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Multas e IPVA"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Multas"),
              Tab(text: "IPVA"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMultasTab(),
            _buildIPVATab(),
          ],
        ),
      ),
    );
  }

  Widget _buildMultasTab() {
    return ListView.builder(
      itemCount: _multas.length,
      itemBuilder: (context, index) {
        final multa = _multas[index];
        return ListTile(
          title: Text(multa.descricao),
          subtitle: Text("R\$${multa.valor.toStringAsFixed(2)} - ${multa.data.day}/${multa.data.month}/${multa.data.year}"),
          trailing: Chip(
            label: Text(multa.status),
            backgroundColor: multa.status == "Paga" ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }

  Widget _buildIPVATab() {
    return ListView.builder(
      itemCount: _ipvas.length,
      itemBuilder: (context, index) {
        final ipva = _ipvas[index];
        return ListTile(
          title: Text("IPVA ${ipva.ano}"),
          subtitle: Text("R\$${ipva.valor.toStringAsFixed(2)}"),
          trailing: Chip(
            label: Text(ipva.status),
            backgroundColor: ipva.status == "Pago" ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }
}