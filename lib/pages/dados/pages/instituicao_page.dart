// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InstituicaoPage extends StatefulWidget {
   InstituicaoPage({Key? key}) : super(key: key);

   TextEditingController textEditingControllerInstituicaoDeEnsino = new TextEditingController();
   TextEditingController textEditingControllerMatricula = new TextEditingController();
   TextEditingController textEditingControllerTurno = new TextEditingController();
   TextEditingController textEditingControllerCurso = new TextEditingController();

   @override
  State<InstituicaoPage> createState() => _InstituicaoPageState();
}

class _InstituicaoPageState extends State<InstituicaoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        SizedBox(
          // width: 328,
          child: TextField(
            controller: widget.textEditingControllerInstituicaoDeEnsino,
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
            controller: widget.textEditingControllerMatricula,
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
            controller: widget.textEditingControllerTurno,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Turno',
            ),
          ),
        ),
        SizedBox(height: 8,),
        SizedBox(
          // width: 328,
          child: TextField(
            controller: widget.textEditingControllerCurso,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Curso',
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
