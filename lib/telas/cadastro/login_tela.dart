import 'package:flutter/material.dart';
import 'tipo_cadastro.dart';
import '../tela_inicial.dart'; 
import '../../services/auth_service.dart';
import '../../utils/validadores.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _fazerLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final usuario = await _authService.login(
        _emailController.text.trim(),
        _senhaController.text.trim(),
      );

      if (usuario != null) {
        // Login bem-sucedido
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        // Login falhou
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email ou senha incorretos'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao fazer login: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text('Sign In',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const Text('Olá! Bem vindo de volta'),
              const SizedBox(height: 24),
              
              // Campo Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: Validadores.validarEmail,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              
              // Campo Senha
              TextFormField(
                controller: _senhaController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: Validadores.validarSenha,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _fazerLogin(),
              ),
              
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RedefinirSenhaTela(),
                      ),
                    );
                  },
                  child: const Text('Esqueceu a senha?',
                      style: TextStyle(color: Colors.orange)),
                ),
              ),
              
              // Botão Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _fazerLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Login'),
                ),
              ),
              
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Text(" Ou, logue com "),
                  Expanded(child: Divider())
                ],
              ),
              const SizedBox(height: 16),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.g_mobiledata, size: 40),
                  Icon(Icons.facebook, size: 30),
                  Icon(Icons.alternate_email, size: 30),
                ],
              ),
              const SizedBox(height: 16),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não tem uma conta ainda? '),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TipoLoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Cadastre-se'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RedefinirSenhaTela extends StatefulWidget {
  const RedefinirSenhaTela({super.key});

  @override
  State<RedefinirSenhaTela> createState() => _RedefinirSenhaTelaState();
}

class _RedefinirSenhaTelaState extends State<RedefinirSenhaTela> {
  final _emailController = TextEditingController();
  final _novaSenhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  bool _obscureNovaSenha = true;
  bool _obscureConfirmarSenha = true;

  Future<void> _redefinirSenha() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Verificar se o email existe
    final emailExiste = await _authService.emailExiste(_emailController.text.trim());
    
    if (!emailExiste) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email não encontrado'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Em uma aplicação real, aqui enviaríamos um email de redefinição
    // ou atualizaríamos a senha no banco de dados
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Instruções de redefinição enviadas para seu email'),
      ),
    );
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Redefinir Senha')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: Validadores.validarEmail,
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _novaSenhaController,
                decoration: InputDecoration(
                  labelText: 'Nova senha',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureNovaSenha ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureNovaSenha = !_obscureNovaSenha;
                      });
                    },
                  ),
                ),
                obscureText: _obscureNovaSenha,
                validator: Validadores.validarSenha,
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _confirmarSenhaController,
                decoration: InputDecoration(
                  labelText: 'Confirmar nova senha',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmarSenha ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmarSenha = !_obscureConfirmarSenha;
                      });
                    },
                  ),
                ),
                obscureText: _obscureConfirmarSenha,
                validator: (value) => Validadores.validarConfirmarSenha(
                  _novaSenhaController.text, 
                  value
                ),
              ),
              const SizedBox(height: 20),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _redefinirSenha,
                child: const Text('Redefinir Senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}