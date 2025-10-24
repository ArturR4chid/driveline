import 'package:flutter/material.dart';

class ConfiguracoesTela extends StatelessWidget {
  const ConfiguracoesTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Editar Perfil"),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Alterar Senha"),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Configurações de Notificações"),
          ),
        ],
      ),
    );
  }
}