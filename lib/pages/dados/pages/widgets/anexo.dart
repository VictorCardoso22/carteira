import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Anexo extends StatelessWidget {
  final String imagePath; // Para Celular
  Uint8List imageUint8 = Uint8List(8); // Para Web
  bool imageFromServer = false;
  Anexo({Key? key, required this.imagePath, required this.imageUint8})
      : super(key: key) {
    if(imagePath.contains("https://")){
      imageFromServer = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 340,
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: kIsWeb
              ? Image.memory(imageUint8, fit: BoxFit.cover)
              : imageFromServer? Image.network(imagePath) : Image.file(File(imagePath), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
