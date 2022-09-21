import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 56),
              const Center(
                child: SizedBox(
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: SizedBox(
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomPrimaryButton(
                onPressed: () {
                  print("teste essa desgraça");
                },
                titulo: 'Entrar',
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text('Esqueci minha senha'),
              ),
              Expanded(child: SizedBox.expand()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 2,
                    color: Color(0xFFD9D9D9),
                  ),
                  const Text(
                    'Não tenho cadastro',
                    style: TextStyle(
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 2,
                    color: Color(0xFFD9D9D9),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomPrimaryButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cadastro');
                },
                titulo: 'Solicitar minha carteirinha',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
