import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("/login");
                  },
                  icon: const Icon(Icons.close),
                  label: const Text(""),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Solicitar carteirinha',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              const Center(
                child: SizedBox(
                  width: 328,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CPF',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 328,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CustomPrimaryButton(
                    small: true,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/dados');
                    },
                    titulo: 'Avançar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
