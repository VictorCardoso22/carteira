import 'package:carteira/design-system/components/constants.dart';
import 'package:carteira/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/cadastro/cadastro_page.dart';
import 'pages/dados/dados_page.dart';
import 'pages/splash/splash_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Carteira de estudante',
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/cadastro': (_) => const CadastroPage(),
        '/dados': (_) => const DadosPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,

        colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
        ),

        // Define the default font family.
        fontFamily: 'Roboto Condensed',
      ),
      // home: HomePage(),
    );
  }
}
