import 'package:flutter/material.dart';
import 'consulta/consulta_pecas_telas.dart';
import 'agendamento/agendamento_tela.dart'; 
import 'problemas_carro_tela.dart'; // ✅ NOVO - Requisito 4
import 'multas_ipva_tela.dart';    // ✅ NOVO - Requisito 17
import 'emergencia_tela.dart';     // ✅ NOVO - Requisito 9
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Coordenadas de São Paulo, SP
    final initialLocation = LatLng(-19.9167, -43.9333);
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Your Location',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'São Paulo, SP',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_outline, color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Como podemos te ajudar hoje?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // Primeira linha de botões
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildOptionButton(context, 'manutenção', true, null),
                const SizedBox(width: 8),
                _buildOptionButton(context, 'emergência', false, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  EmergenciaTela()),
                  );
                }),
                const SizedBox(width: 8),
                _buildOptionButton(
                  context,
                  'agendamentos',
                  false,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AgendamentoTela()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            
            // Segunda linha de botões (NOVOS)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildOptionButton(context, 'problemas', false, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ProblemasCarroTela()),
                  );
                }),
                const SizedBox(width: 8),
                _buildOptionButton(context, 'multas/ipva', false, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MultasIPVATela()),
                  );
                }),
                const SizedBox(width: 8),
                _buildOptionButton(context, 'peças', false, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ConsultaPecasTela()),
                  );
                }),
              ],
            ),
            
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/car.png',
                height: 150,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sua localização atual',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Ative as permissões de localização para uma busca mais precisa',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 180,
                width: double.infinity,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: initialLocation,
                    initialZoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 40.0,
                          height: 40.0,
                          point: initialLocation,
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConsultaPecasTela(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Agenda'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Serviços'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),
        ],
      ),
    );
  }

  Widget _buildOptionButton(
      BuildContext context, String text, bool selected, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}