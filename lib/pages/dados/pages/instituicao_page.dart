// ignore_for_file: prefer_const_constructors

import 'package:carteira/common_codes.dart';
import 'package:flutter/material.dart';

class InstituicaoPage extends StatefulWidget {
  TextEditingController textEditingControllerInstituicaoDeEnsino = new TextEditingController();
  TextEditingController textEditingControllerMatricula = new TextEditingController();
  TextEditingController textEditingControllerCurso = new TextEditingController();
  bool matutino = false;
  bool vespertino = false;
  bool noturno = false;

  InstituicaoPage({Key? key}) : super(key: key) {
    if(DataUser.dataUser != null){
      textEditingControllerCurso.text = DataUser.dataUser!.curso!;
     // listTurno = DataUser.dataUser!.turno as List<String>;
      textEditingControllerMatricula.text = DataUser.dataUser!.numeroMatriculaFaculdade!;
      textEditingControllerInstituicaoDeEnsino.text = DataUser.dataUser!.instituicao!;

      DataUser.dataUser!.turno!.forEach((element) {
        if(element == "matutino") matutino = true;
        if(element == "verpertino") matutino = true;
        if(element == "noturno") matutino = true;
        listTurno.add("$element");
      });
    }

  }




  List<String> listTurno = [];





  @override
  State<InstituicaoPage> createState() => _InstituicaoPageState();
}

class _InstituicaoPageState extends State<InstituicaoPage> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // width: 328,
          child: TextFormField(
            controller: widget.textEditingControllerInstituicaoDeEnsino,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Instituição de Ensino*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo instituição de ensino não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          // width: 328,
          child: TextFormField(
            controller: widget.textEditingControllerCurso,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Curso*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo Curso de ensino não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            controller: widget.textEditingControllerMatricula,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Matricula*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo matricula não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Turno:", style: TextStyle(fontSize: 16)),
              Row(children: [
                Row(
                  children: [
                    Text("Matutino"),
                    Checkbox( value: widget.matutino, onChanged: (value){
                      if(value!) {
                        widget.listTurno.add("matutino");
                      } else{
                        widget.listTurno.remove("matutino");
                      }
                      setState(() {
                        widget.matutino = value;
                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    Text("Vespertino"),
                    Checkbox(value: widget.vespertino, onChanged: (value){
                      if(value!) {
                        widget.listTurno.add("vespertino");
                      } else{
                        widget.listTurno.remove("vespertino");
                      }
                      setState(() {
                        widget.vespertino = value;
                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    Text("Noturno"),
                    Checkbox(value: widget.noturno, onChanged: (value){
                      if(value!) {
                        widget.listTurno.add("noturno");
                      } else{
                        widget.listTurno.remove("noturno");
                      }
                      setState(() {
                        widget.noturno = value;
                      });
                    }),
                  ],
                )
              ],),
            ],
          )
          // TextFormField(
          //   controller: widget.textEditingControllerTurno,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(10)),
          //     ),
          //     labelText: 'Turno*',
          //   ),
          //   validator: (text) {
          //     if (text == null || text.isEmpty) {
          //       return 'O campo turno não pode ser vazio!';
          //     }
          //
          //     return null;
          //   },
          // ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
