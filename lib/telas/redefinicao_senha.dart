import 'package:flutter/material.dart';

class RedefinirSenhaTela extends StatefulWidget {
  const RedefinirSenhaTela({super.key});

  @override
  State<RedefinirSenhaTela> createState() => _RedefinirSenhaTelaState();
}

class _RedefinirSenhaTelaState extends State<RedefinirSenhaTela> {
  final _emailController = TextEditingController();
  final _novaSenhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Redefinir Senha')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) => value!.isEmpty ? 'Informe o e-mail' : null,
              ),
              TextFormField(
                controller: _novaSenhaController,
                decoration: const InputDecoration(labelText: 'Nova senha'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Informe a nova senha' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Senha redefinida com sucesso!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Redefinir Senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
