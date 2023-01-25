import 'package:carteira/common_codes.dart';
import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:carteira/design-system/components/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carteira/model/user.dart';
import 'package:toast/toast.dart';

import '../../design-system/buttons/custon_secondary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isLoading = false;
  TextEditingController usernameController =
      new TextEditingController(text: "fgualberto.santos@gmail.com");
  TextEditingController passwordController =
      new TextEditingController(text: "pipoca123");

  @override
  void initState() {
    initializeDefault();
    ToastContext().init(context); // Configura o toast
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              Center(
                child: SizedBox(
                  width: 328,
                  child: TextField(
                    controller: usernameController,
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
              Center(
                child: SizedBox(
                  width: 328,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
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
              isLoading!
                  ? Center(child: CircularProgressIndicator())
                  : CustomPrimaryButton(
                      onPressed: () {
                        trySignin();
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
              const SizedBox(height: 16),
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

  trySignin() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usernameController.text.trimRight(),
              password: passwordController.text)
          .then((value) {
        // setPreferencesCredentials(widget.usernameController.text.trimRight(), widget.passwordController.text);
        getFirebaseData(); // TODO pegar informacoes do usuario
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        toastAviso("Usuário ou senha incorretos", Colors.red, context);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        toastAviso("Usuário ou senha incorretos", Colors.red, context);
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> getFirebaseData() async {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print('Document data: ${documentSnapshot.data()}');
        DataUser.dataUser = UserModel.fromJson(documentSnapshot.data());
        Get.toNamed("/navegacao");
        //User //documentSnapshot.data();
      }
    });
  }

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    print('Initialized default app $app');
  }
}
