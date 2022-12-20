import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/anexo.dart';
import 'widgets/preview_page.dart';

class AnexoPage extends StatefulWidget {
  const AnexoPage({Key? key}) : super(key: key);

  @override
  State<AnexoPage> createState() => _AnexoPageState();
}

class _AnexoPageState extends State<AnexoPage> {
  File? arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    final file = await picker.getImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => arquivo = File(file.path));
    }
  }

  showPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (arquivo != null) Anexo(arquivo: arquivo!),
        SizedBox(
          // width: 328,
          child: ElevatedButton(
            onPressed: (() => Get.to(
                  () => CameraCamera(
                    onFile: (File file) => showPreview(file),
                  ),
                )),
            // onPressed: () => Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => CameraCamera(
            //       onFile: (File file) => print(file),
            //     ),
            //   ),
            // ),
            //  CameraCamera(
            //       onFile: (file) => print(file),
            //     ),);
            child: Text("Tire uma Foto"),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          // width: 328,
          child: ElevatedButton(
            onPressed: (() => getFileFromGallery()),

            // onPressed: () => Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => CameraCamera(
            //       onFile: (File file) => print(file),
            //     ),
            //   ),
            // ),
            //  CameraCamera(
            //       onFile: (file) => print(file),
            //     ),);
            child: Text("Anexar imagem"),
          ),
        ),
      ],
    );
  }
}
