import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/veiculo_widget.dart';
import 'api_config.dart';

class VeiculoService {
  final String baseUrl = "${ApiConfig.baseUrl}/veiculos";

  Future<List<Veiculo>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((v) => Veiculo.fromMap(v)).toList();
    } else {
      throw Exception("Erro ao buscar veículos");
    }
  }

  Future<void> create(Veiculo veiculo) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(veiculo.toMap()),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Erro ao cadastrar veículo");
    }
  }
}
