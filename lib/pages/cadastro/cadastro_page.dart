import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                    // Navigator.of(context).popAndPushNamed("/cadastro");
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF747474),
                  ),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
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
                      // Navigator.of(context).pushNamed('/dados');
                      Get.toNamed('/dados');
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
