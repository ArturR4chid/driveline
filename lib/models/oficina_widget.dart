
class Empresa {
  final int? id;
  final String nomeFantasia;
  final String razaoSocial;
  final String cnpj;
  final String email;
  final String telefone;
  final Endereco endereco;
  final List<Servico> listaServico;

  Empresa({
    this.id,
    required this.nomeFantasia,
    required this.razaoSocial,
    required this.cnpj,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.listaServico,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeFantasia': nomeFantasia,
      'razaoSocial': razaoSocial,
      'cnpj': cnpj,
      'email': email,
      'telefone': telefone,
      'endereco': endereco.toMap(),
      'listaServico': listaServico.map((s) => s.toMap()).toList(),
    };
  }

  factory Empresa.fromMap(Map<String, dynamic> map) {
    return Empresa(
      id: map['id'],
      nomeFantasia: map['nomeFantasia'],
      razaoSocial: map['razaoSocial'],
      cnpj: map['cnpj'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: Endereco.fromMap(map['endereco']),
      listaServico: List<Servico>.from(
        map['listaServico']?.map((x) => Servico.fromMap(x)) ?? [],
      ),
    );
  }
}

class Endereco {
  final String rua;
  final String numero;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;

  Endereco({
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.cep,
  });

  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'cep': cep,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map['rua'],
      numero: map['numero'],
      bairro: map['bairro'],
      cidade: map['cidade'],
      estado: map['estado'],
      cep: map['cep'],
    );
  }
}

// Classe de serviço (assumindo que você já tinha algo assim)
class Servico {
  final String nome;
  final double preco;

  Servico({
    required this.nome,
    required this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'preco': preco,
    };
  }

  factory Servico.fromMap(Map<String, dynamic> map) {
    return Servico(
      nome: map['nome'],
      preco: map['preco'],
    );
  }
}
