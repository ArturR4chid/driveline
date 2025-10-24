import 'package:flutter/material.dart';
import 'login_tela.dart';
import 'package:flutter/gestures.dart';
import 'termos_politica_page.dart';


class CadastroMecanicoScreen extends StatefulWidget {
  const CadastroMecanicoScreen({super.key});

  @override
  State<CadastroMecanicoScreen> createState() => _CadastroMecanicoScreenState();
}

class _CadastroMecanicoScreenState extends State<CadastroMecanicoScreen> {
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
                  "Crie sua conta Empresarial",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),
              _campoTexto("Nome da Oficina ou Empresa"),
              _campoTexto("CNPJ ou CPF"),
              _campoTexto("Endereço completo"),
              _campoTexto("Telefone para contato"),
              _campoTexto("Horário de funcionamento"),
              _campoTexto("CPF"),

              const SizedBox(height: 10),
              
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
      child: Text.rich(
        TextSpan(
          text: "Eu concordo com os ",
          style: const TextStyle(color: Colors.black87),
          children: [
            TextSpan(
              text: "termos e política.",
              style: const TextStyle(color: Colors.orange),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermosPoliticaPage(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    ),
  ],
),


              const SizedBox(height: 10),
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
                  onPressed: concorda
                      ? () {
                          // Aqui você direciona para escolha do tipo
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        }
                      : null,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _campoTexto(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
    );
  }
}


