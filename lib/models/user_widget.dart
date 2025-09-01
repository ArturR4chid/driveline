class Usuario {
  final int id;
  final String nome;
  final String email;
  final String senha;
  final String telefone;
  final String cpf;
  final String tipo; // 'mecanico' ou 'usuario'

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.telefone,
    required this.cpf,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
      'telefone': telefone,
      'cpf': cpf,
      'tipo': tipo,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
      telefone: map['telefone'],
      cpf: map['cpf'],
      tipo: map['tipo'],
    );
  }
}