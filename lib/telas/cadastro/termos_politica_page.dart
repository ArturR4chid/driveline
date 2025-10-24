import 'package:flutter/material.dart';

class TermosPoliticaPage extends StatelessWidget {
  const TermosPoliticaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Termos e Política de Privacidade",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.orange),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Termos de Uso",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Ao utilizar este aplicativo, você concorda em fornecer informações verdadeiras e "
              "em não usar a plataforma para fins ilegais, fraudulentos ou que possam causar danos "
              "a outros usuários ou à empresa responsável pelo app. O uso indevido poderá resultar "
              "em suspensão ou exclusão da conta.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 25),

            const Text(
              "Política de Privacidade",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Nós respeitamos a sua privacidade. As informações fornecidas (como nome, e-mail, "
              "telefone e CPF) são utilizadas apenas para autenticação, comunicação e melhorias "
              "nos serviços oferecidos. Nenhum dado pessoal é compartilhado com terceiros sem "
              "seu consentimento.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 25),

            const Text(
              "Coleta de Dados",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "O aplicativo pode coletar dados de uso, como tempo de acesso e tipo de dispositivo, "
              "com o objetivo de aprimorar a experiência do usuário e corrigir falhas técnicas.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 25),

            const Text(
              "Consentimento",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Ao continuar utilizando o aplicativo, você declara que leu e concorda com todos os "
              "termos e políticas descritos acima. Caso não concorde, recomendamos não prosseguir "
              "com o uso do app.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 40),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Voltar",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
