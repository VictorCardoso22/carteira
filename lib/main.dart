import 'package:carteira/cadastro/cadastro_page.dart';
import 'package:carteira/dados/dados_page.dart';
import 'package:carteira/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/splash/splash_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carteira de estudante',
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/cadastro': (_) => const CadastroPage(),
        '/dados': (_) => const DadosPage(),
      },
      // home: HomePage(),
    );
  }
}
