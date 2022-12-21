// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InstituicaoPage extends StatefulWidget {
  const InstituicaoPage({Key? key}) : super(key: key);

  @override
  State<InstituicaoPage> createState() => _InstituicaoPageState();
}

class _InstituicaoPageState extends State<InstituicaoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Instituição de Ensino',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Matricula',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Turno',
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
