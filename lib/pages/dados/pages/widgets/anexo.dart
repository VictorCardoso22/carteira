import 'dart:io';

import 'package:flutter/material.dart';

class Anexo extends StatelessWidget {
  final File arquivo;
  Anexo({Key? key, required this.arquivo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 340,
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            arquivo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
