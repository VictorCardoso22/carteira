import 'dart:io';

import 'package:carteira/common_codes.dart';
import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:carteira/design-system/components/colors.dart';
import 'package:carteira/model/endereco.dart';
import 'package:carteira/model/user.dart';
import 'package:carteira/pages/dados/pages/anexo_page.dart';
import 'package:carteira/pages/dados/pages/dados_pessoais_page.dart';
import 'package:carteira/pages/dados/pages/instituicao_page.dart';
import 'package:carteira/pages/login/login_page.dart';
import 'package:carteira/pages/navegacao/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file/cross_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DadosPage extends StatefulWidget {
  String? cpf;

  DadosPessoaisPage? dadosPessoaisPage;
  InstituicaoPage? instituicaoPage;
  AnexoPage? anexoPage;
  bool isCreating = false;

   DadosPage({Key? key, this.cpf}) : super(key: key) {
     dadosPessoaisPage = DadosPessoaisPage(cpf: cpf,);
     instituicaoPage = InstituicaoPage();
     anexoPage = AnexoPage();
   }

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  int _index = 0;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Theme(
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
                              if(DataUser.dataUser == null) {
                                registerUserFirebase();
                              } else{
                                alertDialogConfirmacaoAtualizar();
                              }

                            } else {
                              setState(() {
                                bool listTurnoBoolean = true;

                                if (_index == 1) {
                                  if (widget.instituicaoPage!.listTurno.isEmpty) {
                                    listTurnoBoolean = false;
                                    toastAviso(
                                        "Defina o turno que estuda", Colors.red,
                                        context);
                                  }
                                }
                                debugPrint("aqui2");
                                if (((_formKeys[_index].currentState!
                                    .validate()) && listTurnoBoolean) ??
                                    false) {
                                  debugPrint("aqui1");
                                  continued();
                                  //print('continuando $isLastStep');
                                }
                              });
                            }

                            //  _formKeys[_index].currentState?.validate()
                          },
                          onStepCancel: cancel,
                          steps: getSteps(),
                          controlsBuilder: (context, details) => Column(
                            children: [
                              widget.isCreating? Center(child: CircularProgressIndicator(),) : CustomPrimaryButton(
                                  titulo: _index == getSteps().length - 1
                                      ? DataUser.dataUser == null? 'Enviar': 'Atualizar dados'
                                      : 'Avançar',
                                  onPressed: details.onStepContinue!),
                              const SizedBox(height: 10),
                              if (_index != 0)
                                widget.isCreating? Text("Enviando...") : TextButton(
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
            child: Form(key: _formKeys[0], child: widget.dadosPessoaisPage!),
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
            child: Form(key: _formKeys[1], child: widget.instituicaoPage!),
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
            child: Form(key: _formKeys[2], child: widget.anexoPage!),
          ),
          isActive: _index >= 0,
          state: _index >= 2 ? StepState.complete : StepState.disabled,
        ),
      ];

  alertDialogConfirmacaoAtualizar() {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildAlertDialog(
            context: context,
            titulo: "Atualizar dados",
            aceitar: "Confirmar",
            cancelar: "Cancelar",
            text:
            "Ao clicar em confirmar, após validação dos dados, sua carteria será atualizada",
            onPressedConfirma: () {
            });
      });
}
  updateUserFirebase(){

  }

  registerUserFirebase() async {
    String email = widget.dadosPessoaisPage!.textEditingControllerEmail.text;
    String password = widget.dadosPessoaisPage!.textEditingControllerSenha.text;
   // debugPrint("$email aaaa");
  //  debugPrint("$password bbb");
    UserCredential userCredential;
    // setState(() {
    //   isLoading = true;
    // });
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //debugPrint("teste");
      setState(() {
        widget.isCreating = true;
      });
      await addUserFirebase(userCredential.user!.uid);
      setState(() {
        widget.isCreating = false;
      });
      toastAviso("Cadastro criado com sucesso!", Colors.greenAccent, context);
      Get.toNamed('/login');
      debugPrint("teste");
    } on FirebaseAuthException catch (e) {
      debugPrint("teste");
      if (e.code == 'weak-password') {
        // setState(() {
        //   isLoading = false;
        // });
        toastAviso("Senha fraca, favor colocar uma senha mais forte",
            Colors.red, context);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // setState(() {
        //   isLoading = false;
        // });
        toastAviso("Já existe um cadastro com esse email", Colors.red, context);
        print('The account already exists for that email.');
      } else if (e.code == "invalid-email") {
        toastAviso("Email invalido", Colors.red, context);
      }
      print('${e.code}');
    } catch (e) {
      print(e);
    }
  }

  addUserFirebase(String uidUser) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();
    ///Step 1
    String cpfText = widget.dadosPessoaisPage!.textEditingControllerCpf.text;
    userModel.nome = widget.dadosPessoaisPage!.textEditingControllerNomeCompleto.text;
    userModel.nomeCompleto = widget.dadosPessoaisPage!.textEditingControllerNomeCompleto.text;
    userModel.cpf = widget.dadosPessoaisPage!.maskFormatterCPF.unmaskText(cpfText); // Mandar cpf sem a mascara.
    userModel.rg = widget.dadosPessoaisPage!.textEditingControllerRg.text;
    userModel.dataNascimento = widget.dadosPessoaisPage!.textEditingControllerDataNascimento.text;
    // userModel.endereco =
    // """
    // Logradouro: ${widget.dadosPessoaisPage!.textEditingControllerLogradouro.text}
    // Bairro: ${widget.dadosPessoaisPage!.textEditingControllerBairro.text}
    // Número: ${widget.dadosPessoaisPage!.textEditingControllerNumeroEndereco.text}
    // Complemento: ${widget.dadosPessoaisPage!.textEditingControllerComplemento.text}
    // """;
    ///--------------------------------------------------------------------------------------------------///
    String cep = widget.dadosPessoaisPage!.textEditingControllerCep.text;
    userModel.endereco = Endereco(cep: widget.dadosPessoaisPage!.maskFormatterCEP.unmaskText(cep),
        logradouro: '${widget.dadosPessoaisPage!.textEditingControllerLogradouro.text}',
        bairro: '${widget.dadosPessoaisPage!.textEditingControllerBairro.text}',
        numero: '${widget.dadosPessoaisPage!.textEditingControllerNumeroEndereco.text}',
        complemento: '${widget.dadosPessoaisPage!.textEditingControllerComplemento.text}'
    );
    ///Step 2
    userModel.email = widget.dadosPessoaisPage!.textEditingControllerEmail.text.trim();
    userModel.turno = widget.instituicaoPage!.listTurno;
    userModel.curso = widget.instituicaoPage!.textEditingControllerCurso.text;
    userModel.instituicao = widget.instituicaoPage!.textEditingControllerInstituicaoDeEnsino.text;
    userModel.numeroMatriculaFaculdade = widget.instituicaoPage!.textEditingControllerMatricula.text;
    userModel.instituicao = widget.instituicaoPage!.textEditingControllerInstituicaoDeEnsino.text;
    ///---------------------------------------------------------------------------------------------------///
    
    ///Step 3
    userModel.rgFrenteAnexo = await addUserImages(file: XFile(widget.anexoPage!.arquivoRgFrentePath!), nameFile: "rgFrente");
    userModel.rgVersoAnexo = await addUserImages(file: XFile(widget.anexoPage!.arquivoRgVersoPath!), nameFile: "rgVerso");
    userModel.fotoAnexo = await addUserImages(file: XFile(widget.anexoPage!.arquivoFotoPath!), nameFile: "fotoPerfil");
    userModel.comprovanteResidenciaAnexo = await addUserImages(file: XFile(widget.anexoPage!.arquivoComprovanteResidenciaPath!), nameFile: "comprovanteResidencia");
    userModel.declaracaoEscolarAnexo = await addUserImages(file: XFile(widget.anexoPage!.arquivoDeclaracaoEscolarPath!), nameFile: "decalaracaoEscolar");
    ///--------------------------------------------------------------------------------------------------///

    userModel.ativo = false; // O usuario tem que ser aprovado para ficar ativo
    userModel.timeStampCriacao = DateTime.now().toIso8601String();
    firestore
        .collection('users')
        .doc(uidUser)
        .set(userModel.toJson())
        .then((value) {
      setState(() {});
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> addUserImages({XFile? file, nameFile}) async {
    final _firebaseStorage = FirebaseStorage.instance;
    User? user = FirebaseAuth.instance.currentUser;
    //Upload to Firebase
    var snapshot = await _firebaseStorage
        .ref()
        .child('${user!.uid}/$nameFile')
        .putData(await file!.readAsBytes());
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
