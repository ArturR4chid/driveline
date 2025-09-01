import 'package:flutter/material.dart';
import 'telas/welcome_tela.dart';
import 'telas/agendamento/agendamento_tela.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'telas/problemas_carro_tela.dart';
import 'telas/multas_ipva_tela.dart';
import 'telas/emergencia_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu Carro App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreen(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/agendamento': (context) => const AgendamentoTela(),
        '/problemas': (context) => ProblemasCarroTela(),
        '/multas-ipva': (context) => MultasIPVATela(),
        '/emergencia': (context) => EmergenciaTela(),

      },
      // Localização para DatePicker em português
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}




