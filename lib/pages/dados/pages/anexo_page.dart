import 'dart:io';


import 'package:camera_camera/camera_camera.dart';
import 'package:carteira/common_codes.dart';
import 'package:carteira/design-system/components/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/anexo.dart';
import 'widgets/preview_page.dart';

class AnexoPage extends StatefulWidget {
  AnexoPage({Key? key}) : super(key: key) {

  }
  // XFile
  XFile? arquivoFotoFile;
  XFile? arquivoRgFrenteFile;
  XFile? arquivoRgVersoFile;
  XFile? arquivoComprovanteResidenciaFile;
  XFile? arquivoDeclaracaoEscolarFile;
  // Path
  String? arquivoFotoPath;
  String? arquivoRgFrentePath;
  String? arquivoRgVersoPath;
  String? arquivoComprovanteResidenciaPath;
  String? arquivoDeclaracaoEscolarPath;
  // Uint8
  Uint8List? arquivoFotoUint8 = Uint8List(8);
  Uint8List? arquivoRgFrenteUint8 = Uint8List(8);
  Uint8List? arquivoRgVersoUint8 = Uint8List(8);
  Uint8List? arquivoComprovanteResidenciaUint8 = Uint8List(8);
  Uint8List? arquivoDeclaracaoEscolarUint8 = Uint8List(8);
  
  @override
  State<AnexoPage> createState() => _AnexoPageState();

}

class _AnexoPageState extends State<AnexoPage> {
  XFile? _pickedImage;
  Uint8List uint8Image = Uint8List(8);

  Future<void> getImageUint8List(imageUrl, variavelUint8) async {
    ByteData byteDataReturn = await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl);
    setState(() {
      variavelUint8 = byteDataReturn.buffer.asUint8List();
    });
  }
  @override
  void initState() {
    if(DataUser.dataUser != null){

      widget.arquivoFotoPath = DataUser.dataUser!.fotoAnexo;
      getImageUint8List(DataUser.dataUser!.fotoAnexo, widget.arquivoFotoUint8);

      widget.arquivoRgFrentePath = DataUser.dataUser!.rgFrenteAnexo;
      getImageUint8List(DataUser.dataUser!.fotoAnexo, widget.arquivoRgFrenteUint8);

      widget.arquivoRgVersoPath = DataUser.dataUser!.rgVersoAnexo;
      getImageUint8List(DataUser.dataUser!.fotoAnexo, widget.arquivoRgVersoUint8);

      widget.arquivoComprovanteResidenciaPath = DataUser.dataUser!.comprovanteResidenciaAnexo;
      getImageUint8List(DataUser.dataUser!.fotoAnexo, widget.arquivoComprovanteResidenciaUint8);

      widget.arquivoDeclaracaoEscolarPath = DataUser.dataUser!.declaracaoEscolarAnexo;
      getImageUint8List(DataUser.dataUser!.fotoAnexo, widget.arquivoDeclaracaoEscolarUint8);
    }
    super.initState();
  }

  Future getFileFromGallery(String nomeArquivo) async {
    XFile? image;
    // if (!kIsWeb) {
    //   final ImagePicker picker = ImagePicker();
    //   image = (await picker.pickImage(source: ImageSource.gallery));
    //   if (image != null) {
    //     var selected = XFile(image.path);
    //     setState(() {
    //       _pickedImage = selected;
    //     });
    //   } else {
    //     print('no image has been picked');
    //   }
    // } 
    //else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      image = (await picker.pickImage(source: ImageSource.gallery));
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          uint8Image = f;
         // _pickedImage = XFile('a');
        });
      } else {
        print('no image has been picked');
      }
   // } 

    setState(() {
      if (nomeArquivo == "arquivoFoto") {
        widget.arquivoFotoUint8 = uint8Image;
        widget.arquivoFotoFile = image;
        widget.arquivoFotoPath = image!.path;
      }
      if (nomeArquivo == "arquivoRgFrente") {
        widget.arquivoRgFrenteUint8 = uint8Image;
        widget.arquivoRgFrenteFile = image;
        widget.arquivoRgFrentePath = image!.path;
      }
      if (nomeArquivo == "arquivoRgVerso") {
        widget.arquivoRgVersoUint8 = uint8Image;
        widget.arquivoRgVersoFile = image;
        widget.arquivoRgVersoPath = image!.path;
      }
      if (nomeArquivo == "arquivoComprovanteResidencia") {
        widget.arquivoComprovanteResidenciaUint8 = uint8Image;
        widget.arquivoComprovanteResidenciaFile = image;
        widget.arquivoComprovanteResidenciaPath = image!.path;
      }
      if (nomeArquivo == "arquivoDeclaracaoEscolar") {
        widget.arquivoDeclaracaoEscolarUint8 = uint8Image;
        widget.arquivoDeclaracaoEscolarFile = image;
        widget.arquivoDeclaracaoEscolarPath = image!.path;
      }
    });
  }

  showPreview(String arquivo, File file) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      Get.back();
    }
    setState(() async {
      if (arquivo == "arquivoFoto") {
        //widget.arquivoFotoFile = XFile(file.path);
        widget.arquivoFotoUint8 = await XFile(file.path).readAsBytes();
      }
      if (arquivo == "arquivoRgFrente") {
       // widget.arquivoRgFrenteFile = XFile(file.path);
        widget.arquivoRgFrenteUint8 = await XFile(file.path).readAsBytes();
      }
      if (arquivo == "arquivoRgVerso") {
       // widget.arquivoRgVersoFile = XFile(file.path);
        widget.arquivoRgVersoUint8 = await XFile(file.path).readAsBytes();
      }
      if (arquivo == "arquivoComprovanteResidencia") {
        //widget.arquivoComprovanteResidenciaFile = XFile(file.path);
        widget.arquivoComprovanteResidenciaUint8 = await XFile(file.path).readAsBytes();
      }
      if (arquivo == "arquivoDeclaracaoEscolar") {
       // widget.arquivoDeclaracaoEscolarFile = XFile(file.path);
        widget.arquivoDeclaracaoEscolarUint8 = await XFile(file.path).readAsBytes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (widget.arquivoFotoFile != null)
                Anexo(
                    imagePath: widget.arquivoFotoPath!,
                    imageUint8: widget.arquivoFotoUint8!,
                    ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Foto',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => Get.to(
                                () => CameraCamera(
                                  onFile: (File file) =>
                                      showPreview("arquivoFoto", file),
                                ),
                              )),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: kPrimaryColor,
                          ),
                          // child: Text("Tire uma Foto"),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery(
                               "arquivoFoto")),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 28),
        Container(
          width: 382,
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                // width: 181,
                // height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: kPrimaryLightColor),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Stack(
                  children: [
                    if (widget.arquivoRgFrenteFile != null)
                      SizedBox(
                          width: 150,
                          child: Anexo(
                              imagePath: widget.arquivoRgFrentePath!,
                              imageUint8: widget.arquivoRgFrenteUint8!)),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'RG - Frente',
                                style: TextStyle(color: kPrimaryColor),
                              )),
                        ),
                        Spacer(),
                        SizedBox(
                          // width: 300,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: kPrimaryLightColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: (() => Get.to(
                                        () => CameraCamera(
                                          onFile: (File file) => showPreview(
                                              "arquivoRgFrente", file),
                                        ),
                                      )),
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: kPrimaryColor,
                                  ),
                                  // child: Text("Tire uma Foto"),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: kPrimaryLightColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: (() => getFileFromGallery(

                                      "arquivoRgFrente")),

                                  icon: const Icon(
                                    Icons.drive_file_move_rounded,
                                    color: kPrimaryColor,
                                  ),
                                  // child: Text("Anexar imagem"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Container(
                // width: 181,
                // height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: kPrimaryLightColor),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Stack(
                  children: [
                    if (widget.arquivoRgVersoFile != null)
                      SizedBox(
                          width: 150,
                          child: Anexo(
                              imagePath: widget.arquivoRgVersoPath!,
                              imageUint8: widget.arquivoRgVersoUint8!)),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'RG - Verso',
                                style: TextStyle(color: kPrimaryColor),
                              )),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: (() => Get.to(
                                      () => CameraCamera(
                                        onFile: (File file) =>
                                            showPreview("arquivoRgVerso", file),
                                      ),
                                    )),
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: kPrimaryColor,
                                ),
                                // child: Text("Tire uma Foto"),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: (() => getFileFromGallery(
                                    "arquivoRgVerso")),

                                icon: const Icon(
                                  Icons.drive_file_move_rounded,
                                  color: kPrimaryColor,
                                ),
                                // child: Text("Anexar imagem"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        // Comprovante de Residência
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (widget.arquivoComprovanteResidenciaFile != null)
                Anexo(
                    imagePath: widget.arquivoComprovanteResidenciaPath!,
                    imageUint8: widget.arquivoComprovanteResidenciaUint8!),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Comprovante de Residência',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => Get.to(
                                () => CameraCamera(
                                  onFile: (File file) => showPreview(
                                      "arquivoComprovanteResidencia", file),
                                ),
                              )),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: kPrimaryColor,
                          ),
                          // child: Text("Tire uma Foto"),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery(

                              "arquivoComprovanteResidencia")),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 28),
        // Declaração Escolar
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (widget.arquivoDeclaracaoEscolarFile != null)
                Anexo(
                    imagePath: widget.arquivoDeclaracaoEscolarPath!,
                    imageUint8: widget.arquivoDeclaracaoEscolarUint8!),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Declaração Escolar',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => Get.to(
                                () => CameraCamera(
                                  onFile: (File file) => showPreview(
                                      "arquivoDeclaracaoEscolar", file),
                                ),
                              )),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: kPrimaryColor,
                          ),
                          // child: Text("Tire uma Foto"),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery(

                              "arquivoDeclaracaoEscolar")),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
