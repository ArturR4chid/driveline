import 'package:drivelinepit/telas/ajuda_tela.dart';
import 'package:drivelinepit/telas/atividade_tela.dart';
import 'package:drivelinepit/telas/carteira_tela.dart';
import 'package:drivelinepit/telas/historico_tela.dart';
import 'package:drivelinepit/telas/mensagens_tela.dart';
import 'package:drivelinepit/telas/notificacoes_tela.dart';
import 'package:drivelinepit/telas/promocoes_tela.dart';
import 'package:drivelinepit/telas/suporte_tela.dart';
import 'package:flutter/material.dart';
import 'guias_tela.dart'; 
import 'configuracoes_tela.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Linha com foto e informações
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150?img=3", // foto fake
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Artur Rachid",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text("⭐ 4.94  ·  SP, São Paulo"),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Grid de opções ajustado
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 8, // menos espaçamento
                    mainAxisSpacing: 8, // menos espaçamento
                    childAspectRatio: 1, // mantém proporcional
                    children: [
                      _buildOption(Icons.directions_car, "Guias", onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GuiasTela()),
                        );
                      }),
                      _buildOption(Icons.history, "Histórico", onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HistoricoTela()),
  );
}),

                      _buildOption(Icons.notifications, "Notificações", onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const NotificacoesTela()),
  );
}),
                     _buildOption(Icons.help_outline, "Ajuda", onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AjudaTela()),
  );
}),
                      _buildOption(Icons.account_balance_wallet, "Carteira" , onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CarteiraTela()),
  );
}),
                      _buildOption(Icons.bar_chart, "Atividade", onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AtividadeTela()),
  );
}),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Promoção
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Economize 20% na assinatura do Drive One\n"
                      "Quando você muda para a anual",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Lista inferior
               ListTile(
  leading: const Icon(Icons.settings),
  title: const Text("Configurações"),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConfiguracoesTela()),
    );
  },
),

               ListTile(
  leading: const Icon(Icons.message),
  title: const Text("Mensagens"),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MensagensTela()),
    );
  },
),

                ListTile(
  leading: const Icon(Icons.local_offer),
  title: const Text("Promoções em lojas"),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PromocoesTela()),
    );
  },
),
ListTile(
  leading: const Icon(Icons.support_agent),
  title: const Text("Suporte"),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SuporteTela()),
    );
  },
),

                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      "V. 1.0.00.0",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildOption(IconData icon, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}