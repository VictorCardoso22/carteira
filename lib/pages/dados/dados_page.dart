import 'dart:io';

import 'package:carteira/common_codes.dart';
import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:carteira/design-system/components/constants.dart';
import 'package:carteira/model/user.dart';
import 'package:carteira/pages/dados/pages/anexo_page.dart';
import 'package:carteira/pages/dados/pages/dados_pessoais_page.dart';
import 'package:carteira/pages/dados/pages/instituicao_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({Key? key}) : super(key: key);

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  int _index = 0;
  bool isCompleted = false;
  DadosPessoaisPage dadosPessoaisPage = DadosPessoaisPage();
  InstituicaoPage instituicaoPage = InstituicaoPage();
  AnexoPage anexoPage = AnexoPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCompleted
          ? const Center(
              child: Text('Completo'),
            )
          : Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                primary: kPrimaryColor,
              )),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 38),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                              // Navigator.of(context).popAndPushNamed("/cadastro");
                            },
                            icon: const Icon(
                              Icons.close,
                              color: kPrimaryColor,
                            ),
                          ),
                          const SizedBox(width: 100),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Cadastro',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: Stepper(
                          elevation: 0,
                          type: StepperType.horizontal,
                          physics: const ScrollPhysics(),
                          currentStep: _index,
                          onStepTapped: (step) => tapped(step),
                          onStepContinue: () {
                            final isLastStep = _index == getSteps().length - 1;
                            if (isLastStep) {
                              registerUserFirebase();
                            //  Map allData = Map();
                              //map[""] = "";


                              //print('Completed $isLastStep');
                            } else {
                              continued();
                              //print('continuando $isLastStep');
                            }
                          },
                          onStepCancel: cancel,
                          steps: getSteps(),
                          controlsBuilder: (context, details) => Column(
                            children: [
                              CustomPrimaryButton(
                                  titulo: _index == getSteps().length - 1
                                      ? 'Enviar'
                                      : 'Avançar',
                                  onPressed: details.onStepContinue!),
                              const SizedBox(height: 10),
                              if (_index != 0)
                                TextButton(
                                    onPressed: details.onStepCancel!,
                                    child: const Text('Voltar')),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  List<Step> getSteps() => [
        Step(
          title: const Text(
            'Pessoal',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: dadosPessoaisPage,
          ),
          isActive: _index >= 0,
          state: _index >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text(
            'Instituição',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: instituicaoPage,
          ),
          isActive: _index >= 0,
          state: _index >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text(
            'Anexos',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: anexoPage,
          ),
          isActive: _index >= 0,
          state: _index >= 2 ? StepState.complete : StepState.disabled,
        ),
      ];

  registerUserFirebase() async {
    String email = dadosPessoaisPage.textEditingControllerEmail.text;
    String password = dadosPessoaisPage.textEditingControllerSenha.text ;
    debugPrint("$email aaaa");
    debugPrint("$password bbb");
    UserCredential userCredential;
    // setState(() {
    //   isLoading = true;
    // });
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      debugPrint("teste");
      addUserFirebase(userCredential.user!.uid);
      setState(() => isCompleted = true);
      debugPrint("teste");
    } on FirebaseAuthException catch (e) {
      debugPrint("teste");
      if (e.code == 'weak-password') {
        // setState(() {
        //   isLoading = false;
        // });
        toastAviso("Senha fraca, favor colocar uma senha mais forte", Colors.red, context);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // setState(() {
        //   isLoading = false;
        // });
        toastAviso("Já existe um cadastro com esse email", Colors.red, context);
        print('The account already exists for that email.');
      }
      print('${e.code}');
    } catch (e) {
      print(e);
    }


  }

  addUserFirebase(String uidUser) async {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();
    userModel.nome = dadosPessoaisPage.textEditingControllerNomeCompleto.text ;
    userModel.nomeCompleto = dadosPessoaisPage.textEditingControllerNomeCompleto.text ;
    userModel.cpf = dadosPessoaisPage.textEditingControllerCpf.text ;
    userModel.rg = dadosPessoaisPage.textEditingControllerRg.text ;
    userModel.rgFrenteAnexo = await addUserImages(file: anexoPage.arquivoRgFrente , nameFile: "rgFrente" ) ;
    userModel.rgVersoAnexo = await addUserImages(file: anexoPage.arquivoRgVerso , nameFile: "rgVerso") ;
    userModel.fotoAnexo = await addUserImages(file: anexoPage.arquivoFoto , nameFile: "fotoPerfil" ) ;
    userModel.comprovanteResidenciaAnexo = await addUserImages(file: anexoPage.arquivoComprovanteResidencia , nameFile: "comprovanteResidencia" ) ;
    userModel.declaracaoEscolarAnexo = await addUserImages(file: anexoPage.arquivoDeclaracaoEscolar , nameFile: "decalaracaoEscolar" ) ;
    // //  userModel.curso = instituicaoPage. ;
    userModel.email = dadosPessoaisPage.textEditingControllerEmail.text ;

    userModel.endereco = dadosPessoaisPage.textEditingControllerLogradouro.text ;
    userModel.dataNascimento = dadosPessoaisPage.textEditingControllerDataNascimento.text ;
    userModel.numeroMatriculaFaculdade = instituicaoPage.textEditingControllerMatricula.text ;

    firestore.collection('users').doc(uidUser).set(userModel.toJson()).then((value) {
      setState(() {

      });

    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> addUserImages({File? file,nameFile}) async {

    final _firebaseStorage = FirebaseStorage.instance;
    User? user = FirebaseAuth.instance.currentUser;
      //Upload to Firebase
      var snapshot = await _firebaseStorage.ref()
          .child('${user!.uid}/$nameFile')
          .putFile(file!);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
       // imageUrl = downloadUrl;
      });
      return downloadUrl;
  }

  tapped(int step) {
    setState(() => _index = step);
  }

  continued() {
    _index < 2 ? setState(() => _index += 1) : null;
  }

  cancel() {
    _index > 0 ? setState(() => _index -= 1) : null;
  }
}
