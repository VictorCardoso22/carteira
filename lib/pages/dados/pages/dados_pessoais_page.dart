// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({Key? key}) : super(key: key);

  @override
  State<DadosPessoaisPage> createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CPF',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome completo',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Data de nascimento',
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              flex: 3,
              // width: 282,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'RG',
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              // width: 38,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Emissor',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              flex: 4,
              // width: 282,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CEP',
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              // width: 38,
              child: ElevatedButton.icon(
                  onPressed: () {}, icon: Icon(Icons.search), label: Text("")),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Logradouro',
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              flex: 3,
              // width: 282,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bairro',
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              // width: 38,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nº',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Complemento',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
