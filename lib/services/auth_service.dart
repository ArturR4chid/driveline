import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../models/user_widget.dart';

class AuthService {
  // Carregar usuários do arquivo JSON
  Future<List<Usuario>> carregarUsuarios() async {
    try {
      // Tenta carregar do caminho lib/models/repository/usuarios.json
      final String response = await rootBundle.loadString('lib/models/repository/usuarios.json');
      final data = await json.decode(response);
      
      List<Usuario> usuarios = [];
      for (var user in data['usuarios']) {
        usuarios.add(Usuario(
          id: user['id'],
          nome: user['nome'],
          email: user['email'],
          senha: user['senha'],
          telefone: user['telefone'],
          cpf: user['cpf'] ?? '',
          tipo: user['tipo'] ?? 'usuario',
        ));
      }
      return usuarios;
    } catch (e) {
      debugPrint('Erro ao carregar usuários de lib/models/repository/usuarios.json: $e');
      
      // Tenta carregar do caminho assets/json/usuarios.json (fallback)
      try {
        final String response = await rootBundle.loadString('assets/json/usuarios.json');
        final data = await json.decode(response);
        
        List<Usuario> usuarios = [];
        for (var user in data['usuarios']) {
          usuarios.add(Usuario(
            id: user['id'],
            nome: user['nome'],
            email: user['email'],
            senha: user['senha'],
            telefone: user['telefone'],
            cpf: user['cpf'] ?? '',
            tipo: user['tipo'] ?? 'usuario',
          ));
        }
        return usuarios;
      } catch (e2) {
        debugPrint('Erro ao carregar de assets/json/usuarios.json: $e2');
        
        // Usuários padrão para teste se ambos os caminhos falharem
        return _getUsuariosPadrao();
      }
    }
  }

  // Usuários padrão para fallback
  List<Usuario> _getUsuariosPadrao() {
    return [
      Usuario(
        id: 1,
        nome: 'Maria Silva',
        email: 'maria@gmail.com',
        senha: '123456',
        telefone: '11999999999',
        cpf: '111.222.333-44',
        tipo: 'usuario',
      ),
      Usuario(
        id: 2,
        nome: 'João Souza',
        email: 'joao@gmail.com',
        senha: 'abcdef',
        telefone: '11988888888',
        cpf: '555.666.777-88',
        tipo: 'usuario',
      ),
      Usuario(
        id: 3,
        nome: 'Oficina Central',
        email: 'oficina@email.com',
        senha: 'mecanico123',
        telefone: '1133333333',
        cpf: '999.888.777-66',
        tipo: 'mecanico',
      ),
    ];
  }

  // Validar login
  Future<Usuario?> login(String email, String senha) async {
    try {
      final usuarios = await carregarUsuarios();
      
      for (var user in usuarios) {
        if (user.email == email && user.senha == senha) {
          return user;
        }
      }
      return null;
    } catch (e) {
      debugPrint('Erro no login: $e');
      return null;
    }
  }

  // Validar se email já existe
  Future<bool> emailExiste(String email) async {
    try {
      final usuarios = await carregarUsuarios();
      return usuarios.any((user) => user.email == email);
    } catch (e) {
      debugPrint('Erro ao verificar email: $e');
      return false;
    }
  }

  // Registrar novo usuário
  Future<bool> registrarUsuario(Usuario novoUsuario) async {
    try {
      // Em uma aplicação real, aqui salvaríamos no backend
      debugPrint('Usuário registrado: ${novoUsuario.nome}');
      return true;
    } catch (e) {
      debugPrint('Erro ao registrar usuário: $e');
      return false;
    }
  }
}