import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:carteira/design-system/components/constants.dart';
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
  File? arquivoFoto;
  File? arquivoRgFrente;
  File? arquivoRgVerso;
  File? arquivoComprovanteResidencia;
  File? arquivoDeclaracaoEscolar;

  
  final picker = ImagePicker();

  Future getFileFromGallery(File? arquivo) async {
    final file = await picker.getImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => arquivo = File(file.path));
    }
  }

  showPreview(String arquivo,file) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      Get.back();
    }
    setState(() {
      if(arquivo == "arquivoFoto"){
        arquivoFoto = file;
      }
      if(arquivo == "arquivoRgFrente"){
        arquivoRgFrente = file;
      }
      if(arquivo == "arquivoRgVerso"){
        arquivoRgVerso = file;
      }
      if(arquivo == "arquivoComprovanteResidencia"){
        arquivoComprovanteResidencia = file;
      }
      if(arquivo == "arquivoDeclaracaoEscolar"){
        arquivoDeclaracaoEscolar = file;
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
              if (arquivoFoto != null) Anexo(arquivo: arquivoFoto!),
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
                                  onFile: (File file) => showPreview("arquivoFoto",file),
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
                          onPressed: (() => getFileFromGallery(arquivoFoto)),

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
                    if (arquivoRgFrente != null) SizedBox(width: 150, child: Anexo(arquivo: arquivoRgFrente!)),
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
                          height:40,
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
                                          onFile: (File file) =>
                                              showPreview("arquivoRgFrente",file),
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
                                  onPressed: (() => getFileFromGallery(arquivoRgFrente)),

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
                    if (arquivoRgVerso != null) SizedBox(width: 150, child: Anexo(arquivo: arquivoRgVerso!)),
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
                                            showPreview("arquivoRgVerso",file),
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
                                onPressed: (() => getFileFromGallery(arquivoRgVerso)),

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
              if (arquivoComprovanteResidencia != null) Anexo(arquivo: arquivoComprovanteResidencia!),
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
                                  onFile: (File file) => showPreview("arquivoComprovanteResidencia",file),
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
                          onPressed: (() => getFileFromGallery(arquivoComprovanteResidencia)),

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
              if (arquivoDeclaracaoEscolar != null) Anexo(arquivo: arquivoDeclaracaoEscolar!),
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
                                  onFile: (File file) => showPreview("arquivoDeclaracaoEscolar",file),
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
                          onPressed: (() => getFileFromGallery(arquivoDeclaracaoEscolar)),

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
