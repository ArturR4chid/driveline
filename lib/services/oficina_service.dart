import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/oficina_widget.dart';
import 'api_config.dart';

class OficinaService {
  final String baseUrl = "${ApiConfig.baseUrl}/oficinas";

  Future<List<Empresa>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((o) => Empresa.fromMap(o)).toList();
    } else {
      throw Exception("Erro ao buscar oficinas");
    }
  }

  Future<void> create(Empresa oficina) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(oficina.toMap()),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Erro ao cadastrar oficina");
    }
  }
}
