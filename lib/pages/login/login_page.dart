import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:carteira/design-system/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design-system/buttons/custon_secondary_button.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Center(
                child: SizedBox(
                  width: 200,
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/logo.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              const Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              const SizedBox(height: 20),
              const Center(
                child: SizedBox(
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
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
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 2,
                    color: kSupportColor,
                  ),
                  const Text(
                    'Não tenho cadastro',
                    style: TextStyle(
                      color: kSupportColor,
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 2,
                    color: kSupportColor,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomSecondaryButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/cadastro');
                  Get.toNamed('/cadastro');
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
