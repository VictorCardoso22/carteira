// ignore_for_file: prefer_const_constructors

import 'package:carteira/design-system/components/colors.dart';
import 'package:flutter/material.dart';

class DadosPessoaisPage extends StatefulWidget {
  TextEditingController textEditingControllerCpf = new TextEditingController();
  TextEditingController textEditingControllerNomeCompleto =
      new TextEditingController();
  TextEditingController textEditingControllerDataNascimento =
      new TextEditingController();
  TextEditingController textEditingControllerRg = new TextEditingController();
  TextEditingController textEditingControllerEmissor =
      new TextEditingController();
  TextEditingController textEditingControllerCep = new TextEditingController();
  TextEditingController textEditingControllerLogradouro =
      new TextEditingController();
  TextEditingController textEditingControllerBairro =
      new TextEditingController();
  TextEditingController textEditingControllerNumero =
      new TextEditingController();
  TextEditingController textEditingControllerComplemento =
      new TextEditingController();
  TextEditingController textEditingControllerEmail =
      new TextEditingController();
  TextEditingController textEditingControllerSenha =
      new TextEditingController();

  DadosPessoaisPage({Key? key}) : super(key: key);

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
            controller: widget.textEditingControllerCpf,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'CPF',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            controller: widget.textEditingControllerNomeCompleto,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Nome completo',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            controller: widget.textEditingControllerDataNascimento,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
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
              // width: 296,
              child: TextField(
                controller: widget.textEditingControllerRg,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'RG',
                ),
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              // width: 90,
              child: TextField(
                controller: widget.textEditingControllerCpf,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
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
                controller: widget.textEditingControllerCep,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'CEP',
                ),
              ),
            ),
            SizedBox(width: 18),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: kPrimaryLightColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            controller: widget.textEditingControllerLogradouro,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
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
                controller: widget.textEditingControllerBairro,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Bairro',
                ),
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              // width: 38,
              child: TextField(
                controller: widget.textEditingControllerNumero,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Complemento',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            controller: widget.textEditingControllerEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Email',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            controller: widget.textEditingControllerSenha,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Senha',
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
