import 'package:carteira/common_codes.dart';
import 'package:carteira/design-system/components/colors.dart';
import 'package:carteira/pages/dados/dados_page.dart';
import 'package:carteira/pages/navegacao/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavegacaoPage extends StatefulWidget {
  NavegacaoPage({Key? key}) : super(key: key);

  @override
  State<NavegacaoPage> createState() => _NavegacaoPageState();
}

class _NavegacaoPageState extends State<NavegacaoPage> {
  int _selectedIndex = 0;
  TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DadosPage(),
    Container()
  ];
  void _onItemTapped(int index) {
    if (index == 2) {
      Get.offNamedUntil("/login", (route) => false);
      DataUser.dataUser = null;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Carteira',
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Dados',
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Sair',
            backgroundColor: kPrimaryColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
