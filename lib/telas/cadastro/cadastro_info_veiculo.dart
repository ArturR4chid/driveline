import 'package:flutter/material.dart';
import 'login_tela.dart';

class CadastroVeiculoScreen extends StatefulWidget {
  const CadastroVeiculoScreen({super.key});

  @override
  State<CadastroVeiculoScreen> createState() => _CadastroVeiculoScreenState();
}

class _CadastroVeiculoScreenState extends State<CadastroVeiculoScreen> {
  bool concorda = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botão de voltar
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Informações do seu veículo",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 30),
              // Campos de entrada
              _campoTexto("Nome do Veículo"),
              _campoTexto("Marca"),
              _campoTexto("Modelo"),
              _campoTexto("Ano"),
              _campoTexto("Placa"),
              _campoTexto("Número do Chassi"),
              // Adicione estes campos extras no formulário
              _campoTexto("Quilometragem"),
              _campoTexto("Cor"),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Tipo de Combustível",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items:
                    ["Gasolina", "Álcool", "Diesel", "Flex", "Elétrico"]
                        .map(
                          (combustivel) => DropdownMenuItem(
                            value: combustivel,
                            child: Text(combustivel),
                          ),
                        )
                        .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              // Checkbox termos
              Row(
                children: [
                  Checkbox(
                    value: concorda,
                    activeColor: Colors.orange,
                    onChanged: (val) {
                      setState(() {
                        concorda = val ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: "Eu concordo com os ",
                        style: TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(
                            text: "terms & policy.",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              // Botão LOGIN
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed:
                      concorda
                          ? () {
                            // Navega de volta para a tela de login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                          : null,
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // Login social
              const Center(
                child: Text(
                  "ou faça Cadastro rápido com",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton("assets/google.png"),
                  const SizedBox(width: 20),
                  _socialButton("assets/facebook.png"),
                  const SizedBox(width: 20),
                  _socialButton("assets/twitter.png"),
                ],
              ),

              const SizedBox(height: 30),
              // Já possui conta
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Já possui uma conta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Logue",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para os campos de texto
  Widget _campoTexto(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  // Botões de login social
  Widget _socialButton(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(assetPath, width: 28, height: 28),
    );
  }
}
