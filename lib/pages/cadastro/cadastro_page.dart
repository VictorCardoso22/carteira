import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:carteira/design-system/components/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_codes.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerCpf = new TextEditingController();
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
                    color: kPrimaryColor,
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
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              Center(
                child: SizedBox(
                  width: 328,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: textEditingControllerCpf,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: 'CPF*',
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'O campo CPF não pode ser vazio!';
                        }

                        return null;
                      },
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
                      if (_formKey.currentState!.validate()) {
                        verificaCadastro(context);
                      }
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

  Future<void> verificaCadastro(BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users')
        .where("cpf", isEqualTo: textEditingControllerCpf.text.trim())
        .get()
        .then((QuerySnapshot querySnapshot) {
      print('${textEditingControllerCpf.text}');
      print('Document data: ${querySnapshot.docs}');
      if (querySnapshot.size == 0) {
        Get.toNamed('/dados');
      } else if (querySnapshot.size >= 0) {
        toastAviso("Esse cpf já está cadastrado", Colors.red, context);
      }
    });
  }
}
