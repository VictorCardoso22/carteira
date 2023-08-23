import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Anexo extends StatefulWidget {

  Uint8List? imageUint8; // Para Web
  bool isLoading = false;
  Anexo({Key? key,required this.imageUint8, required this.isLoading})
      : super(key: UniqueKey()) {

  }

  @override
  State<Anexo> createState() => _AnexoState();
}

class _AnexoState extends State<Anexo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 340,
        height: 120,
        child: widget.isLoading ? Center(child: CircularProgressIndicator(),) : ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child:
            widget.imageUint8 != null? Image.memory(widget.imageUint8!, fit: BoxFit.cover): Center(child: Text("Adicionar foto do documento"),)

        ),
      ),
    );
  }
}
