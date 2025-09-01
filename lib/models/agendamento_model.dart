import 'package:flutter/material.dart';

class Agendamento {
  final String nome;
  final String telefone;
  final DateTime data;
  final TimeOfDay hora;

  Agendamento({
    required this.nome,
    required this.telefone,
    required this.data,
    required this.hora,
  });
}