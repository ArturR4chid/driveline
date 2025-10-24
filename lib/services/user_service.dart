import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';
import '../models/user_widget.dart'; // mantém esse import, se o arquivo estiver aqui

class UserService {
  final String baseUrl = "${ApiConfig.baseUrl}/usuarios";

  Future<List<Usuario>> getAllUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((u) => Usuario.fromMap(u)).toList();
    } else {
      throw Exception("Erro ao buscar usuários");
    }
  }

  Future<Usuario?> login(String email, String senha) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "senha": senha}),
    );

    if (response.statusCode == 200) {
      return Usuario.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<void> createUser(Usuario usuario) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario.toMap()),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Erro ao cadastrar usuário");
    }
  }

  Future<void> resetPassword(int id, String novaSenha) async {
    final response = await http.put(
      Uri.parse("$baseUrl/senha/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"novaSenha": novaSenha}),
    );
    if (response.statusCode != 200) {
      throw Exception("Erro ao redefinir senha");
    }
  }
}
