import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:carteira/design-system/components/colors.dart';
import 'package:carteira/pages/dados/dados_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../common_codes.dart';

class CadastroPage extends StatelessWidget {

  var maskFormatterCPF = new MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
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
                      inputFormatters: [maskFormatterCPF],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: 'CPF*',
                      ),
                      validator: (text) {

                        if (!CPFValidator.isValid(maskFormatterCPF.unmaskText(text!))) {
                          return 'Cpf inválido';
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
    String cpfUnmask  = maskFormatterCPF.unmaskText(textEditingControllerCpf.text).trim();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users')
        .where("cpf", isEqualTo: cpfUnmask)
        .get()
        .then((QuerySnapshot querySnapshot) {
      debugPrint('$cpfUnmask');
      debugPrint('Document data: ${querySnapshot.docs}');
      if (querySnapshot.size == 0) {
        Get.to(DadosPage(cpf: cpfUnmask,));
      } else if (querySnapshot.size >= 0) {
        toastAviso("Esse cpf já está cadastrado", Colors.red, context);
      }
    });
  }
}
