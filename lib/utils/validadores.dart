class Validadores {
  static String? validarEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um email';
    }
    
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, insira um email válido';
    }
    
    return null;
  }

  static String? validarSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma senha';
    }
    
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    
    return null;
  }

  static String? validarConfirmarSenha(String? senha, String? confirmacao) {
    if (confirmacao == null || confirmacao.isEmpty) {
      return 'Por favor, confirme sua senha';
    }
    
    if (senha != confirmacao) {
      return 'As senhas não coincidem';
    }
    
    return null;
  }

  static String? validarNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome';
    }
    
    if (value.length < 3) {
      return 'O nome deve ter pelo menos 3 caracteres';
    }
    
    return null;
  }

  static String? validarTelefone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu telefone';
    }
    
    final phoneRegex = RegExp(r'^\(?\d{2}\)?[\s-]?9?\d{4}-?\d{4}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Por favor, insira um telefone válido';
    }
    
    return null;
  }

  static String? validarCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu CPF';
    }
    
    // Remove caracteres não numéricos
    final cpf = value.replaceAll(RegExp(r'[^\d]'), '');
    
    if (cpf.length != 11) {
      return 'CPF deve ter 11 dígitos';
    }
    
    // Verifica se todos os dígitos são iguais
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) {
      return 'CPF inválido';
    }
    
    // Validação básica de CPF (algoritmo simplificado)
    return null;
  }
}